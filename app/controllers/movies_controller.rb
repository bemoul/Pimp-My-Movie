class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :edit, :create, :new ]


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
    @comments = Comment.all.where(movie:@movie)
    @actors = @movie.actors
    @musics = @movie.musics
    @ratings = @movie.ratings
    @rating_total = 0
    @total = 1
    @ratings = @movie.ratings
    @ratings.each do |rating|
      @rating_total = @rating_total + rating.rate
      @total = @total +1
  end
    @rating_average = @rating_total / @total
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
    @movie = current_user.movies.build(movie_params)
    hash = OmdbService.new()
    escaped_title = CGI.escape(@movie.title)
    @movie.image = hash.get_image_by_title(@movie.title)
    @movie.synopsis = hash.get_synopsis_by_title(@movie.title)
    @movie.director = hash.get_director_by_title(@movie.title)
    @actors_name = hash.get_actor_by_title(@movie.title)
    @actors_name_array = @actors_name.split(",")
    @actors_name_array.each do |value|
    if Actor.exists?(:full_name => value) == false
      @actor = Actor.create(full_name: value)
      @movie_actor = MovieActor.create(movie: @movie, actor: @actor)
    else
      @actor = Actor.find_by(full_name: value)
      @movie_actor = MovieActor.create(movie: @movie, actor: @actor)
    end
  end

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
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
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
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
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
