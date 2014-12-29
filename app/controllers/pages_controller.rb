class PagesController < ApplicationController

  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]

  expose(:pages)
  expose(:page, finder: :find_by_slug, finder_parameter: :slug)

  def create
    @new_page = Page.new(page_params)
    if @new_page.save
      redirect_to slug_path(@new_page.slug), notice: "Page successfully created."
    else
      render 'new'
    end
  end

  def update
    @page = Page.find_by_slug(params[:slug])
    if @page.update_attributes(page_params)
      redirect_to slug_path(@page.slug), notice: "Page successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    page.destroy
    redirect_to :root, notice: "Page successfully deleted."
  end

  private

  def page_params
    params.require(:page).permit(:body, :name, :slug)
  end

end
