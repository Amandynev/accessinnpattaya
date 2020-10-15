class AddColumnToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :address, :string
  end
end
