# frozen_string_literal: true

class CreateMovieMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_musics do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :music, index: true, foreign_key: true

      t.timestamps
    end
  end
end
