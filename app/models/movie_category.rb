# frozen_string_literal: true

class MovieCategory < ApplicationRecord
  belongs_to :movie
  belongs_to :category
end
