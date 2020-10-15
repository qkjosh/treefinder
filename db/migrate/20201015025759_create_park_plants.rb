class CreateParkPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :park_plants do |t|
      t.integer :diameter
      t.decimal :latitude, precision: 17, scale: 14
      t.decimal :longitude, precision: 17, scale: 14

      t.timestamps
    end
  end
end
