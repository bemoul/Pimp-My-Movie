# frozen_string_literal: true

class RatingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(
      rate: params[:rate],
      user_id: current_user.id,
      movie_id: @movie.id
    )
    begin @rating.save
      redirect_to movie_url(@movie), info: 'Your rate has been save!'
    rescue
      redirect_to movie_url(@movie), danger: 'Your rate is not save!, you should only vote once !'
    end
  end
end
