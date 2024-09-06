class Direction < ApplicationRecord
  validates :source, :destination, :distance, presence: true
  has_many :buses, dependent: :destroy
  has_many :trains, dependent: :destroy
  has_many :flights, dependent: :destroy
end
