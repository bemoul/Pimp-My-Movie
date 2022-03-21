class AddReferencesCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :movie_id, :integer
  end
end
