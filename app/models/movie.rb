class Movie < ApplicationRecord
  validates :title, :synopsis, :director, :release_date, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :categories
  has_many :ratings
  has_many :actors
  has_many :musics
end
