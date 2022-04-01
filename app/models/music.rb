# frozen_string_literal: true

class Music < ApplicationRecord
  validates :title, :style, presence: true

  has_many :movie_musics
  has_many :musics, through: :movie_musics
end
