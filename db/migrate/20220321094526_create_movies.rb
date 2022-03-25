class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.string :director
      t.integer :year_of_release

      t.timestamps
    end
  end
end
