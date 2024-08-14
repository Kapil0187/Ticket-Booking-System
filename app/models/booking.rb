class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  has_many :tickets ,dependent: :destroy
  accepts_nested_attributes_for :tickets
end
