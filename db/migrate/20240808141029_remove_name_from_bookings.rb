class RemoveNameFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings ,:first_name, :string
    remove_column :bookings,:last_name, :string
    remove_column :bookings,:age, :string
    remove_column :bookings,:age, :gender
  end
end
