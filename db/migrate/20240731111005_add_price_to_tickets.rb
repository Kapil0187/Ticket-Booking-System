class AddPriceToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :price, :integer
    add_column :tickets, :date, :date
    add_column :tickets, :time, :datetime
  end
end
