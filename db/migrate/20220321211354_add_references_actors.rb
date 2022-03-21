class AddReferencesActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :movie_id, :integer
  end
end
