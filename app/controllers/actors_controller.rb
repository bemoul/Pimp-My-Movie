class ActorsController < ApplicationController
  def index

  @actors = Actor.all
  @movies = Movie.all
  end
  def show


  end
end
