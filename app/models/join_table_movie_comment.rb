class JoinTableMovieComment < ApplicationRecord
  belongs_to :movie
  belongs_to :comment
end
