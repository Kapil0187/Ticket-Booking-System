class AddBusToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :bus, null: false, foreign_key: true
  end
end
