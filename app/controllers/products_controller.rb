class ProductsController < ApplicationController
  expose(:products)
  expose(:product)

  def edit
  end

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
end
