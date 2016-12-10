class CreateBlacklists < ActiveRecord::Migration[5.0]
  def change
    create_table :blacklists do |t|
      t.integer :domain_id, null: false
      t.integer :lens_id, null: false
      t.string :message, null: false

      t.timestamps
    end

    add_index :blacklists, :domain_id
    add_index :blacklists, :lens_id
    add_index :blacklists, [:domain_id, :lens_id], unique: true
  end
end
