class PlantPark < ActiveRecord::Migration[6.0]
  def change
    add_reference :park_plants, :plant, null: false, foreign_key: true
    add_reference :park_plants, :park, null: false, foreign_key: true
  end
end
