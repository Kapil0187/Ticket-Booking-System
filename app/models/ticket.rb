class Ticket < ApplicationRecord
  belongs_to :buse
  belongs_to :booking
end
