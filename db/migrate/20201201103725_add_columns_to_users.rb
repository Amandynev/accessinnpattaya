class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :adress, :string
    add_column :users, :city_code, :string
    add_column :users, :country, :string
  end
end
