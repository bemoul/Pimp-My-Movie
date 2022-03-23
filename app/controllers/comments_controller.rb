class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
end