class JoinTableActorsMovies < ActiveRecord::Migration[5.2]
    def change
      create_table :join_table_actors_movies do |t|
        t.references :actor, index: true, foreign_key: true
        t.references :music, index: true, foreign_key: true
  
        t.timestamps null: false
      end
    end
  end