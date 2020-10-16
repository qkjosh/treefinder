class Genus < ApplicationRecord
  has_many :plants
  belongs_to :family

  validates :name, presence: true
end
