class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :account_login?

  private
  def account_login?
  	session[:account]
  end

end