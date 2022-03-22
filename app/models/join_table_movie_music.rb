class JoinTableMovieMusic < ApplicationRecord
  belongs_to :movie
  belongs_to :music
end
