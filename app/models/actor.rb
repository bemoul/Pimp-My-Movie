class Actor < ApplicationRecord
  has_many :join_table_movie_actors
  has_many :movies, through: :join_table_movie_actors
end
