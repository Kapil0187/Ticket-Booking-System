class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :mode_type

      t.timestamps
    end
  end
end
