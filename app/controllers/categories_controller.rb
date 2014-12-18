class CategoriesController < ApplicationController

  before_filter :require_user, only: [:new, :create, :update, :destroy]
  
  expose(:categories)
  expose(:category)

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: "Category successfully created."
    else
      render 'new'
    end
  end

  def update
    if category.update_attributes(category_params)
      redirect_to root_path, notice: "Category successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to root_path, notice: "Category successfully deleted."
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :image)
  end
end
