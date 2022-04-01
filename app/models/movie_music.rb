# frozen_string_literal: true

class MovieMusic < ApplicationRecord
  belongs_to :movie
  belongs_to :music
end
