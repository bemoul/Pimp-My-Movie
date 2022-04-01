# frozen_string_literal: true

class Category < ApplicationRecord
  validates :style, presence: true
  has_many :movie_categories
  has_many :movies, through: :movie_categories
end
