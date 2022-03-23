class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :categories
  has_many :ratings
  has_many :actors
  has_many :musics
<<<<<<< HEAD
=======
  #has_many :ratings, through: :users
>>>>>>> 73a9240 (add Gemfile.lock)
end
