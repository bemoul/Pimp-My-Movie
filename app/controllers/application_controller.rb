class ApplicationController < ActionController::Base
    before_action :admin_user

  # def admin_user
  #   return if admin_user # or whatever logic to authorize them
  #   redirect_to admin_user_path(current_user) # fallback if not authorized
  # end
  # def authenticate_admin_user!
  #   if current_admin_user.present? and current_user.blank?
  #     sign_in current_admin_user, bypass: true
  #   end

  #   super
  # end
end
