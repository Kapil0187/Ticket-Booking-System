class AddColumnToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :first_name, :string
  end
end
