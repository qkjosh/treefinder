class Park < ApplicationRecord
  has_many :parkplants
  has_many :plants, through: :parkplants
end
