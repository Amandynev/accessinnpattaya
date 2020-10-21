class AddColumnToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :photo, :string
  end
end
