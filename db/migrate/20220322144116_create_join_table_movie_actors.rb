class CreateJoinTableMovieActors < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_movie_actors do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :actor, index: true, foreign_key: true

      t.timestamps
    end
  end
end
