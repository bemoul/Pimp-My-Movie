class Comment < ApplicationRecord
  # validates :description, presence: true
  belongs_to :user
  belongs_to :movie
end
