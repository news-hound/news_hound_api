class CreateLenses < ActiveRecord::Migration[5.0]
  def change
    create_table :lenses do |t|
      t.string :name

      t.timestamps
    end

    add_index :lenses, :name, unique: true
  end
end
