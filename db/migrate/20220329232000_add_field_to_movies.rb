class AddFieldToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :image, :binary
  end
end
