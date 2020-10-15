class AddFamilyToPlant < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :family, foreign_key: true
  end
end
