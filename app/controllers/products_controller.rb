class ProductsController < ApplicationController

  expose(:pages)
  expose(:products)
  expose(:product)

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to products_path, notice: "Product successfully added."
    else
      render 'new'
    end
  end

  def update
    product.save
    redirect_to product, notice: "Product successfully updated."
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: "Product successfully deleted."
  end

  def add_to_cart
    session[:cart].to_a << product
    redirect_to products_path, notice: "Added to cart."
  end
end
