class Train < ApplicationRecord
  validates :name, presence: true
  validates :total_seets, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :price, presence: true
  validates :direction_id, presence: true
  validates :traintype, presence: true

  belongs_to :direction
  has_many :bookings, as: :bookingable
end
