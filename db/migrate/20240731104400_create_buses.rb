class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :total_seets
      t.datetime :departure_time
      t.datetime :arrival_time
      t.references :direction, null: false, foreign_key: true
      t.string :bustype

      t.timestamps
    end
  end
end
