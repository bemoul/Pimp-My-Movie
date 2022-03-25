class Movie < ApplicationRecord
  
  has_one_attached :movie_picture
  validate :movie_picture

  # def movie_picture
  #   if movie_picture.attached?
  #     if movie_picture.blob.byte_size > 1000000
  #       movie_picture.purge
  #       errors[:base] << 'Too big'
  #     elsif !movie_picture.blob.content_type.starts_with?('image/')
  #       movie_picture.purge
  #       errors[:base] << 'Wrong format'
  #     end
  #   end
  # end
  # validates :movie_picture, attached: true, content_type: [:gif, :png, :jpg, :jpeg]
  validates :title, :synopsis, :director, :release_date, presence: true
  validates :release_date, numericality: { greater_than: 1888, less_than:  Date.current.year+1 }
  validates :title, uniqueness: true
  belongs_to :user
  has_many :comments
  has_many :categories
  has_many :ratings
  has_many :actors
  has_many :musics
end

