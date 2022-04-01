class ActorsController < ApplicationController
  def index

  @actors = Actor.all
  @movies = Movie.all
  end
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.find
  end
end
