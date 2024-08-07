class Bus < ApplicationRecord
  belongs_to :direction 
  has_many :booking ,dependent: :destroy
end
