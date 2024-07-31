class CreateDirections < ActiveRecord::Migration[7.1]
  def change
    create_table :directions do |t|
      t.string :source
      t.string :destination
      t.integer :distance

      t.timestamps
    end
  end
end
