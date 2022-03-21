class AddReferencesMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :movie_id, :integer
  end
end
