class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(
      description: params[:description], 
      user_id: current_user.id,
      movie_id: params[:movie_id]
    )
    if @comment.save
      redirect_to movie_url(@movie), info: "Your comment has been save!"
    else
      redirect_to movie_url(@movie), danger: "Your comment is not save!"
    end
  end
end