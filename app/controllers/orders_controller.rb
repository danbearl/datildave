class OrdersController < ApplicationController

  before_filter :require_user, only: [:show, :edit, :update, :destroy]

  expose(:pages)
  expose(:orders)
  expose(:order)
  expose(:order_items) {Order.unpack_products(order.products)}

  def new
    @order = order
    @subtotal = 0 
    @shipping = 0
    frozen_products = 0
    unfrozen_products = 0
    session[:cart].each do |item|
      product = Product.find(item[:product_id].to_i)
      @subtotal += item[:product_price].to_f * item[:product_quantity].to_f
      @shipping += item[:shipping].to_f * item[:product_quantity].to_f
      if product.frozen_product == true
        frozen_products += 1 
      else
        unfrozen_products +=1
      end
    end

    @shipping = 12.65 if unfrozen_products > 0 && frozen_products == 0
    @shipping = 17.65 if unfrozen_products == 0 && frozen_products > 0
    @shipping = 30.3 if unfrozen_products > 0 && frozen_products > 0

  end

  def create
    @order = Order.new(order_params)

    @order.products = Order.package_products(session[:cart])

    if @order.save_with_payment
      
      session[:cart].each do |item|
        product = Product.find(item[:product_id])
        new_quantity = product.quantity - item[:product_quantity].to_i

        product.update_attribute(:quantity, new_quantity)
      end

      session[:cart] = []
      redirect_to root_path, notice: "Thank you for your order!"
    else
      @subtotal = 0 
      @shipping = 0    
      session[:cart].each do |item|
        @subtotal += item[:product_price].to_f * item[:product_quantity].to_f
        @shipping += item[:shipping].to_f * item[:product_quantity].to_f
      end

      render "new"
    end
  end

  def update
    if order.update_attributes(order_params)
      redirect_to order, notice: "Order updated."
    else
      render 'edit'
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_email, :customer_first_name, :customer_last_name, :address_street_1, :address_street_2, :address_city, :address_state, :address_zip, :processed, :notes, :products, :shipped, :shipping, :subtotal, :stripe_card_token)
  end
end
