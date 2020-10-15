class AddGenusToPlant < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :genus, foreign_key: true
  end
end
