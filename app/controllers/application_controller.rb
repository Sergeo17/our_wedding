class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter  :set_p3p

  def set_p3p
    response.headers["P3P"]='CP="CAO PSA OUR"'
  end

end
