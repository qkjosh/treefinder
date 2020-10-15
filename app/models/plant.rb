class Plant < ApplicationRecord
  has_many :parkplants
  has_many :parks, through: :parkplants
  belongs_to :genus
  belongs_to :family
end
