class JoinTableMovieMusic < ApplicationRecord
  has_many :movies
  has_many :musics through: :movies
end
