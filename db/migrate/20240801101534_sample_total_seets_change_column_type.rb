class SampleTotalSeetsChangeColumnType < ActiveRecord::Migration[7.1]
  def change
    change_column(:buses, :total_seets, :integer)
  end
end
