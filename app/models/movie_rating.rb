class MovieRating < ApplicationRecord
  belongs_to :movie
  belongs_to :rating
end
