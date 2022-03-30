class RatingsController < ApplicationController

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
      redirect_to movies_path
    else
      render @movie
    end
  end


end