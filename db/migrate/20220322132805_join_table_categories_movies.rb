class JoinTableCategoriesMovies < ActiveRecord::Migration[5.2]
    def change
      create_table :JoinTableCategoriesMovies do |t|
        t.references :category, index: true, foreign_key: true
        t.references :movie, index: true, foreign_key: true
  
        t.timestamps null: false
      end
    end
  end