module ParksHelper
  def tree_count(park_id)
    ParkPlant.where(park_id: park_id).count
  end

  def species_count(park_id)
    ParkPlant.where(park_id: park_id).pluck(:plant_id).uniq.count
  end

  def species(park_id)
    ParkPlant.where(park_id: park_id).group(:plant_id)
  end
end
