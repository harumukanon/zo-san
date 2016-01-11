class ApplicationController < ActionController::Base
  after_filter  :store_location
  
  def store_location
    if (request.fullpath != "/editors/sign_in" &&
        request.fullpath != "/editors/sign_up" &&
        request.fullpath !~ Regexp.new("\\A/editors/password.*\\z") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath 
    end
  end
  
  def after_sign_in_path_for(resource)
    if (session[:previous_url] == root_path)
      super
    else
      session[:previous_url] || root_path
    end
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
