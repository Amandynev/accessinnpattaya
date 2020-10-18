class CleanDatabase < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :room
  end
end
