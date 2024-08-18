class RemoveBusFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :bus, index: true, foreign_key: true
    remove_column :bookings, :bus_id
  end
end
