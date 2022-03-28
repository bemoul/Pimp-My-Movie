class MusicsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @music = Music.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @music = Music.new(
      title: params[:title], 
      user_id: current_user.id,
      movie_id: params[:movie_id]
    )
    if @music.save
      redirect_to movies_path
    else
      render @movie
    end
  end

end