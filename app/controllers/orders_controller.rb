class OrdersController < ApplicationController

  expose(:pages)
  expose(:orders)
  expose(:order)
  expose(:order_items) {Order.unpack_products(order.products)}

  def new
    @subtotal = 0 
    @shipping = 0    
    session[:cart].each do |item|
      @subtotal += item[:product_price].to_f * item[:product_quantity].to_f
      @shipping += item[:shipping].to_f * item[:product_quantity].to_f
    end

  end

  def create
    @order = Order.new(params[:order])

    @order.products = Order.package_products(session[:cart])

    if @order.save_with_payment
      session[:cart] = []
      redirect_to root_path, notice: "Thank you for your order!"
    else
      redirect_to "/cart/", notice: "Some error prevented processing of your order."
    end
  end

end
