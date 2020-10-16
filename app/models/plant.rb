class Plant < ApplicationRecord
  has_many :parkplants
  has_many :parks, through: :parkplants
  belongs_to :genus, optional: true
  belongs_to :family, optional: true

  validates :common_name, :scientific_name, presence: true
end
