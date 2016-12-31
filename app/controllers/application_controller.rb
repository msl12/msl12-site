class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :account_login?

  rescue_from ActiveRecord::RecordNotFound do
  	render_404
  end

  private
  def account_login?
  	session[:account]
  end

  def render_404
  	render template: "/errors/404", status: 404
  end

end