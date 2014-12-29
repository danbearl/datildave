class ProductsController < ApplicationController

  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]

  expose(:pages)
  expose(:products)
  expose(:product)
  expose(:categories)
  expose(:categories_array_for_select) {
    categories.to_a.map { |cat| [cat.name, cat.id] }
  }

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "Product successfully added."
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(product_params)
      redirect_to @product, notice: "Product successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: "Product successfully deleted."
  end

  def add_to_cart
    unless session[:cart].is_a?(Array) 
      session[:cart] = [] 
    end

    if params[:quantity].to_i > product.quantity || params[:quantity].to_i <= 0
      redirect_to product, notice: "Insufficient quantity in stock!"
    else
      cart = {
        :product_id => params[:product_id],
        :product_name => params[:product_name],
        :product_price => params[:product_price],
        :product_quantity => params[:quantity]
      }

      session[:cart] << cart
      redirect_to root_path, notice: "Added to cart."
    end
  end

  private

  def product_params
    params.require(:product).permit(:description, :image, :name, :price, :quantity, :category_id)
  end
end
