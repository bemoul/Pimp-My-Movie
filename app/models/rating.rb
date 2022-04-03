# frozen_string_literal: true

class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :movie
  validates :rate, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
#   validates :ratings,   uniqueness: { scope: [ :user_id, :movie_id],
#  msg: "Only one vote per guest per movie is permitted"}
end
