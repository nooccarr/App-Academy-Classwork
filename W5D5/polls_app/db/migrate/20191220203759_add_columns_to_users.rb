class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
    add_index :users, :username, unique: true
  end
end
