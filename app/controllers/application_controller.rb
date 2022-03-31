class ApplicationController < ActionController::Base

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :username
  end
  
end
