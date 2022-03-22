class Music < ApplicationRecord
  has_many :join_table_movie_musics
  has_many :movies, through: :join_table_movie_musics
end
