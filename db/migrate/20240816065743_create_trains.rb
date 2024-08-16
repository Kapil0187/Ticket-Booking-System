class CreateTrains < ActiveRecord::Migration[7.1]
  def change
    create_table :trains do |t|
      t.string :name
      t.string :total_seets
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :price
      t.references :direction, null: false, foreign_key: true
      t.string :traintype
      
      t.timestamps
    end
  end
end
