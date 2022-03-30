class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :edit, :create, :new ]


  def home
    @movies = Movie.search(params[:search])
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
    @ratings = @movie.ratings
    @categories = @movie.categories
    @musics = @movie.musics
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
    hash = ImdbService.new()
    escaped_title = CGI.escape(@movie.title)
    @movie.image = hash.get_image_by_title(escaped_title)
    @movie.synopsis = hash.get_synopsis_by_title(@movie.title)
    @movie.director = hash.get_director_by_title(@movie.title)
    @movie.actors = hash.get_actors_by_title(@movie.title)
    @movie.categories = hash.get_categories_by_title(@movie.title)
    #@movie.release_date = hash.get_release_date_by_title(@movie.title)
    # #user.avatar.attach(params[:avatar])
     @movie.image = hash.get_image_by_title(@movie.title)
     @mon_image = hash.get_image_by_title(@movie.title)
    #  open(@mon_image) do |file|
    #  file << open(image_url).read
     
    #  @mon_image.file = file
    #  @mon_image.save
    #  @movie.image.attach(hash.get_image_by_title(@movie.title))
    # end
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
      params.require(:movie).permit(:title, :synopsis, :director, :release_date, :movie_id, :search)
    end

    def comment_params
      params.require(:comment).permit(:description)
    end

    def actor_params
      params.require(:actor).permit(:full_name)
    end


    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
