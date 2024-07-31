class RemoveTimeFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :time, :datetime
  end
end
