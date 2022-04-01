class Movie < ApplicationRecord
  has_one_attached :movie_picture
  validates :title, uniqueness: true
  validates :title, :synopsis, :release_date, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors

  has_many :movie_categories
  has_many :categories, through: :movie_categories

  has_many :ratings, dependent: :destroy
  has_many :movie_musics, dependent: :destroy
  has_many :musics, through: :movie_musics
end
