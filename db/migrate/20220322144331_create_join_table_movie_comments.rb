class CreateJoinTableMovieComments < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_movie_comments do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true

      t.timestamps
    end
  end
end
