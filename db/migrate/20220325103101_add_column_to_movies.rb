class AddColumnToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :year_of_release, :integer
  end
end
