class Booking < ApplicationRecord
  validates :user_id, :date, :mode_type, presence: true
  belongs_to :user
  belongs_to :bookingable, polymorphic: true
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :tickets
end
