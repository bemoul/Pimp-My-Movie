class Music < ApplicationRecord
  validates :title, :style, presence: true
  belongs_to :movie
end
