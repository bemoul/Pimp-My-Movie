class Category < ApplicationRecord
  has_many :join_table_movie_categories
  has_many :movies, through: :join_table_movie_categories
end
