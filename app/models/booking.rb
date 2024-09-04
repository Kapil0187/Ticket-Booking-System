class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bookingable, polymorphic: true
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :tickets
end
