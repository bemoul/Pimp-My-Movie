# frozen_string_literal: true

class MovieActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end
