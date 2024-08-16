class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :total_seets
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :price
      t.references :direction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
