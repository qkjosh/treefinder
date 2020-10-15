class AddFamilyToGenus < ActiveRecord::Migration[6.0]
  def change
    add_reference :genera, :family, null: false, foreign_key: true
  end
end
