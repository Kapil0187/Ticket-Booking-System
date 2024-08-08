class AddLastNameToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :last_name, :string
    add_column :tickets, :age, :integer
    add_column :tickets, :gender, :string
  end
end
