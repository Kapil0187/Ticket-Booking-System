class RemoveBusFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_reference :tickets, :bus, index: true, foreign_key: true
  end
end
