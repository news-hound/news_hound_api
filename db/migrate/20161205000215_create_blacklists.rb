class CreateBlacklists < ActiveRecord::Migration[5.0]
  def change
    create_table :blacklists do |t|
      t.string :domain
      t.string :message
      t.integer :lens_id

      t.timestamps
    end

    add_index :blacklists, :domain, unique: true
    add_index :blacklists, :lens_id
  end
end
