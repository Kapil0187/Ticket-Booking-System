class AddRemaningSeatsToFlight < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :remaning_seats, :integer
  end
end
