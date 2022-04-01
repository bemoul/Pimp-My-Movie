class ApplicationController < ActionController::Base

  add_flash_types :danger, :info, :warning, :succes
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :username
  end
  
end
