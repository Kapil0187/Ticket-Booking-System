class AddRemaningSeatsToTrain < ActiveRecord::Migration[7.1]
  def change
    add_column :trains, :remaning_seats, :integer
  end
end
