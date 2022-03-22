class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, through: JoinTableCommentsMovies
  has_many :categories, through: JoinTableCategoriesMovies
  has_many :ratings
  has_many :actors
  has_many :musics, through: JoinTableMoviesMusics
 # has_many :ratings, through: :users
end
