class CreateMovieRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_ratings do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :rating, index: true, foreign_key: true

      t.timestamps
    end
  end
end
