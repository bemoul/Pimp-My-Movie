class AddReferencesUser < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :user_id, :integer
		add_column :comments, :user_id, :integer
  end
end
