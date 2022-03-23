class JoinTableMovieComment < ApplicationRecord
  has_many :movies
  has_many :comments, through: :movies
end
