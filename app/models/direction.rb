class Direction < ApplicationRecord
  has_many :buses ,dependent: :destroy
end
