class AddAuth < ActiveRecord::Migration[5.0]
  def change
    add_column :lenses, :session_token, :string, null: false
    add_column :lenses, :password_digest, :string, null: false
    add_index :lenses, :session_token, unique: true
    add_index :lenses, :password_digest
  end
end
