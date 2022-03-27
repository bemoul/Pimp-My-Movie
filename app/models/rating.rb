class Rating < ApplicationRecord
  validates :rate, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  has_many :movie_actors
  has_many :movies, through: :movie_actors
end
