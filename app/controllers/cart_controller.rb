class CartController < ApplicationController
  expose(:pages)

  def empty_cart
    session[:cart] = []
    redirect_to "/cart/", notice: "Cart emptied!"
  end

end
