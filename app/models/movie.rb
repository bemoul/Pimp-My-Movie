class Movie < ApplicationRecord
  belongs_to :user

  has_many :JoinTableMovieActors
  has_many :actors, through: :JoinTableMovieActors
end
