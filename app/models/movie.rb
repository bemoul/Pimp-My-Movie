class Movie < ApplicationRecord
  belongs_to :user
  has_many :join_table_movie_actors
  has_many :actors, through: :join_table_movie_actors
end