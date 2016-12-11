class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :url, null: false
      t.integer :lens_id

      t.timestamps
    end

    add_index :articles, :lens_id
  end
end
