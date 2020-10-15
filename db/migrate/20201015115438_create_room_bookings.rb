class CreateRoomBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :room_bookings do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
