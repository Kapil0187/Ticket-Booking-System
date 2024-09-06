class Train < ApplicationRecord
  validates :name, :total_seets, :departure_time, :arrival_time, :price, :direction_id, :traintype, presence: true

  belongs_to :direction
  has_many :bookings, as: :bookingable
end
