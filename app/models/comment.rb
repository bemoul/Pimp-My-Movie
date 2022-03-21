class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :ratings
end
