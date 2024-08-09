class AddNameToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :first_name,:string 
    add_column :bookings, :last_name, :string
    add_column :bookings, :age, :integer 
    add_column :bookings, :gender, :string
  end
end
