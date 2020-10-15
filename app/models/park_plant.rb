class ParkPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :park
end
