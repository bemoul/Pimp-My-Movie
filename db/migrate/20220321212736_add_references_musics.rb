class AddReferencesMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :movie_id, :integer
  
  end
end
