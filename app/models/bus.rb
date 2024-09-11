class Bus < ApplicationRecord
  validates :name, :total_seets, :departure_time, :arrival_time, :price, :direction_id, :bustype, presence: true

  belongs_to :direction
  has_many :bookings, as: :bookingable
end
