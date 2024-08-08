class RemoveGenderFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :gender,:string
  end
end
