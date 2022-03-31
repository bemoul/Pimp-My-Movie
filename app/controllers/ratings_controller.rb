class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(
      rate: params[:rate], 
      user_id: current_user.id,
      movie_id: params[:movie_id]
    )
    if @rating.save
      redirect_to movie_url(@movie), info: "Your rate has been save!"
    else
      redirect_to movie_url(@movie), danger: "Your rate is not save!"
    end
  end
end