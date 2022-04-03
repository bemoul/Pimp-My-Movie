class ProfilesController < ApplicationController
  before_action :set_user, only: %i[update edit show]

  def index
    @user = current_user
    @user_email = current_user.email
    @movies = Movie.all.where(user: @user)
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = current_user
  end
end
