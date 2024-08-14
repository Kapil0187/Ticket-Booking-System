class RemoveFirstNameFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :first_name
    remove_column :tickets, :last_name
  end
end
