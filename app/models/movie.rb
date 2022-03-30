class Movie < ApplicationRecord

  has_one_attached :movie_picture
  #validate :movie_picture
  #validates :title, :synopsis, :director, :release_date, presence: true
  validates :release_date, numericality: { greater_than: 1888, less_than:  Date.current.year+1 }
  validates :title, uniqueness: true
  #validates :movie_picture, attached: true, content_type: [:png, :jpg, :jpeg]
  
  belongs_to :user
  has_many :comments

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_categories
  has_many :categories, through: :movie_categories

  has_many :movie_ratings
  has_many :ratings, through: :movie_ratings

  has_many :movie_musics
  has_many :musics, through: :movie_musics

  def self.search(search)
    if search
      movie = Movie.find_by(name: search)
    if movie
      self.where(movie_id: movie)
    else
    Movie.all
    end
  end
  end
  
def self.find_or_create(search)
        movie = OmdbService.search(search)
        @movie = Movie.find_or_create_by(title: movie["Title"], 
        category: movie["Genre"], 
        release_date: movie["Released"],
        image: movie["Poster"],
        actors: movie["Actors"],
        synopsis: movie["Plot"],
        rating: movie["imdbRating"],
        director: movie["Director"]) 
    end
end

