class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :full_name

      t.timestamps
    end
  end
end
