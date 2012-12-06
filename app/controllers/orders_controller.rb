class OrdersController < ApplicationController

  expose(:pages)
  expose(:orders)
  expose(:order)
  expose(:order_items) {Order.unpack_products(order.products)}

  def create
    @order = Order.new

    @order.products = Order.package_products(session[:cart])

    if @order.save
      redirect_to root_path, notice: "Order successfully processed!"
    end
  end

end
