class Movie < ApplicationRecord
  validates :title, :synopsis, :director, :release_date, presence: true
  validates :release_date, numericality: {less_than: Time.now.year+1}
  
  belongs_to :user
  has_many :comments
  has_many :categories
  has_many :ratings
  has_many :actors
  has_many :musics
end
