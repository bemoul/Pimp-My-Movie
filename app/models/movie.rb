class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :JoinTableMovieActor
  has_many :JoinTableMovieCategory
  has_many :JoinTableMovieComment
  has_many :JoinTableMovieMusic

  # has_many :comments, through: JoinTableCommentsMovies
  # has_many :categories, through: JoinTableCategoriesMovies
  # has_many :ratings
  # has_many :actors
  # has_many :musics, through: JoinTableMoviesMusics
 # has_many :ratings, through: :users
end
