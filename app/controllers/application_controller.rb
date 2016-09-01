class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:page_slugs ) { Page.select(:slug).map(&:slug) }
  expose(:categories) { Category.all.order(:priority) }
  expose(:featured_products) { Product.where('featured = ?', true) }
  expose(:featured_pages) {Page.where('featured = ?', true) }

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      redirect_to :root, notice: "You must be logged in to do that."
      return false
    end
  end
  
end
