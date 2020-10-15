class Genus < ApplicationRecord
  has_many :plants
  belongs_to :family
end
