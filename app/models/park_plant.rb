class ParkPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :park

  validates :diameter, :latitude, :longitude, presence: true
  validates :diameter, numericality: { only_integer: true }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
