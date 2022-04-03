# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[show edit create new]

  def home
    @movies = Movie.all
  end

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
    @comments = Comment.all.where(movie: @movie)
    @actors = @movie.actors
    @musics = @movie.musics
    @ratings = @movie.ratings

    @rating_total = @movie.ratings.size
    @rating_average =  @movie.ratings.average(:rate)
    @rating_average =  @rating_average.to_f.round(1)

  end

  # GET /movies/new
  def new
    if current_user
      @movie = current_user.movies.build
    else
      redirect_to new_user_session_path
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies or /movies.json
  def create
        @found = true
        @actors_name = ""
        @movie = current_user.movies.build(movie_params)
      begin
        hash = OmdbService.new
      rescue
        puts "something went wrong in the service"
        render  "movies/home"
      end
        @escaped_title = CGI.escape(@movie.title)
    if hash.exist?(@escaped_title) == "False"
          flash[:alert] = "Movie not found. please check the title is correclty writed"
          @found = false
     
        
    elsif hash.exist?(@escaped_title) == "True"
          # binding.pry
        @movie.image = hash.get_image_by_title(@escaped_title)
        @movie.synopsis = hash.get_synopsis_by_title(@escaped_title)
        @movie.director = hash.get_director_by_title(@escaped_title)
        @movie.release_date = hash.get_year_by_title(@escaped_title)
        @movie.save
        @actors_name = hash.get_actor_by_title(@escaped_title)
        @actors_name_array = @actors_name.split(',')
        @actors_name_array.each do |value|
            @actor = if Actor.exists?(full_name: value) == false
                      Actor.create(full_name: value)
                    else
                      Actor.find_by(full_name: value)
                    end
            @movie_actor = MovieActor.create(movie: @movie, actor: @actor)
            end


        respond_to do |format|
            
          if @movie.save
            format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully created.' }
            format.json { render :show, status: :created, location: @movie }
    
          else
            # 
            format.html { render  "movies/home", notice: 'Error in the title of the movie, please check again'}
            format.json { render json: @movie.errors, status: :unprocessable_entity }

          end
    
    
        end  
        
      else    
        flash[:alert] = "The api dind't response correctly on this movie "
        # render  "movies/home", notice: 'Something went wrong with the  response of the api'  
        # redirect_to movies_path, notice: 'Something went wrong with the  response of the api' 
        respond_to do |format|
          format.html { render  "movies/home", notice: 'Something went wrong with the  response of the api'}
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end


  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :synopsis, :director, :release_date, :image)
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = 'Please log in.'
      redirect_to new_session_path
    end
  end
end
