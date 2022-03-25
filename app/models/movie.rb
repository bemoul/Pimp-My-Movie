class Movie < ApplicationRecord
  
  has_one_attached :movie_picture

  validates :title, :synopsis, :director, :year_of_release, presence: true
  validates :year_of_release, numericality: { greater_than: 1888, less_than:  Date.current.year+1 }
  validates :title, uniqueness: true
  belongs_to :user
  has_many :comments
  has_many :categories
  has_many :ratings
  has_many :actors
  has_many :musics
end

