class AddReferenceRating < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :user_id, :integer
  end
end
