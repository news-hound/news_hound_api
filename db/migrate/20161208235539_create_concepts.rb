class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :keywords, array: true, default: [], null: false
      t.string :message, null: false
      t.integer :lens_id, null: false

      t.timestamps
    end
  end
end
