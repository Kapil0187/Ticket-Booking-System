class Bus < ApplicationRecord
  belongs_to :direction
  has_many :tickets
end
