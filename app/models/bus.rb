class Bus < ApplicationRecord
  belongs_to :direction 
  has_many :bookings, as: :bookingable
end
