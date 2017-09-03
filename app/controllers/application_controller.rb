class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::InvalidAuthenticityToken do
    redirect_to root_path if !request.xhr?
  end
end
