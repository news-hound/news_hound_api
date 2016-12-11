class AddRebuttals < ActiveRecord::Migration[5.0]
  def change
    add_column :blacklists, :rebuttal_id, :integer, null: true
    add_column :concepts, :rebuttal_id, :integer, null: true
  end
end
