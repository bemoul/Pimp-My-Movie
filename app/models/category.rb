class Category < ApplicationRecord
  validates :style, presence: true
  belongs_to :movie
end
