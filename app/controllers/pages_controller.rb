class PagesController < ApplicationController

  expose(:pages)
  expose(:page, finder: :find_by_slug, finder_parameter: :slug)
  expose(:new_page, model: Page)

  def create
    if new_page.save
      redirect_to slug_path(new_page.slug), notice: "Page successfully created."
    else
      render 'new'
    end
  end

  def update
    if page.save
      redirect_to slug_path(page.slug), notice: "Page successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    page.destroy
    redirect_to :root, notice: "Page successfully deleted."
  end

end
