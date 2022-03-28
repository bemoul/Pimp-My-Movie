class MovieMusic < ApplicationRecord
  belongs_to :movie
  belongs_to :music
end
