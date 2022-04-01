# frozen_string_literal: true

class AddReferencesComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :movie_id, :integer
  end
end
