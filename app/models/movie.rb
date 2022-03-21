class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :categories
  has_many :ratings
  has_many :actors
  has_many :originals_soundtracks
end
