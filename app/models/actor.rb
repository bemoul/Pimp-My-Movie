class Actor < ApplicationRecord
  has_many :actors, through: :JoinTableMovieActors
  has_many :JoinTableMovieActors, through: :actors
end
