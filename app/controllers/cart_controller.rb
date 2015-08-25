class CartController < ApplicationController
  expose(:pages)

  def show
    if session[:cart].is_a? NilClass
      redirect_to :root
    end
  end

  def empty_cart
    session[:cart] = []
    redirect_to "/cart/", notice: "Cart emptied!"
  end

end
