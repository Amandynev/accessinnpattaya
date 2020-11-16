class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :category, null: false, foreign_key: true
      t.string :photo
      t.string :phototwo
      t.string :photothree
    end
  end
end
