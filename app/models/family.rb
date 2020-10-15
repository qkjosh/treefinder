class Family < ApplicationRecord
  has_many :genera
  has_many :plants
end
