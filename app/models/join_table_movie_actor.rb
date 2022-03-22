class JoinTableMovieActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end