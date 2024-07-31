class RemoveDateFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :date, :date
  end
end
