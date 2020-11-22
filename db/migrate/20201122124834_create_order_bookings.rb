class CreateOrderBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :order_bookings do |t|
      t.references :order, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
