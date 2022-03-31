class Movie < ApplicationRecord
  
  has_one_attached :movie_picture
  validates :title, uniqueness: { case_sensitive: false }
  validates :synopsis, :director, :release_date, presence: true
  validates :release_date, numericality: { greater_than: 1888, less_than:  Date.current.year+1 }
  validates :title, uniqueness: true
  
  
  belongs_to :user
  has_many :comments

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_categories
  has_many :categories, through: :movie_categories

  has_many :ratings

  has_many :movie_musics
  has_many :musics, through: :movie_musics

end

