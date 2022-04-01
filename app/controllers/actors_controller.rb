class ActorsController < ApplicationController

  def show
    @actors = Actor.find_by(params[:id])
  end

end