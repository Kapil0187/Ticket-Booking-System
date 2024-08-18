class AddBookingableToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :bookingable, polymorphic: true, null: false
  end
end
