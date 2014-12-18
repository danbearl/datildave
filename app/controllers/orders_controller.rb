class OrdersController < ApplicationController

  before_filter :require_user, only: [:update, :destroy]

  expose(:pages)
  expose(:orders)
  expose(:order)
  expose(:order_items) {Order.unpack_products(order.products)}

  def new
    @order = order
    @subtotal = 0 
    @shipping = 0    
    session[:cart].each do |item|
      @subtotal += item[:product_price].to_f * item[:product_quantity].to_f
      @shipping += item[:shipping].to_f * item[:product_quantity].to_f
    end

  end

  def create
    @order = Order.new(order_params)

    @order.products = Order.package_products(session[:cart])

    if @order.save_with_payment
      session[:cart] = []
      redirect_to root_path, notice: "Thank you for your order!"
    else
      redirect_to "/cart/", notice: "Some error prevented processing of your order."
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_email, :customer_first_name, :customer_last_name, :address_street_1, :address_street_2, :address_city, :address_state, :address_zip, :processed, :notes, :products, :shipped, :shipping, :subtotal, :stripe_card_token)
  end
end
