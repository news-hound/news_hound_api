class AddRebuttals < ActiveRecord::Migration[5.0]
  def change
    add_column :blacklists, :rebuttal_id, :integer
    add_column :concepts, :rebuttal_id, :integer
    add_index :blacklists, :rebuttal_id
    add_index :concepts, :rebuttal_id
  end
end
