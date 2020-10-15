class Plant < ApplicationRecord
  has_many :parkplants
  has_many :parks, through: :parkplants
  belongs_to :genus, optional: true
  belongs_to :family, optional: true
end
