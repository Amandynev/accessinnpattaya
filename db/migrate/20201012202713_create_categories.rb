class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :room_size
      t.string :bed_size
      t.boolean :balcony
      t.boolean :corner_table
      t.boolean :smoking
    end
  end
end
