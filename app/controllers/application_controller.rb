class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:page_slugs ) { Page.select(:slug).map(&:slug) }
  expose(:categories)
  expose(:latest_products) { Product.last(4) }

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
