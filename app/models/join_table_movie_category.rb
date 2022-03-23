class JoinTableMovieCategory < ApplicationRecord
  has_many :movies 
  has_many :categories, through: :movies
end
