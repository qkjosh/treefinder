ParkPlant.destroy_all
Park.destroy_all
Plant.destroy_all
Genus.destroy_all
Family.destroy_all

family = Family.create( name: "Urticaceae" )
genus = family.genera.create( name: "Urtica" )
plant1 = genus.plants.create( common_name: "Stinging nettle", scientific_name: "Urtica dioica")
plant2 = family.plants.create( common_name: "Stinging nettle", scientific_name: "Urtica submitis")
plant3 = Plant.create( common_name: "Stinging nettle", scientific_name: "Urtica haussknechtii", genus_id: genus.id, family_id: family.id)
park = Park.create( name: 'Champlain C.C', latitude: 49.876025652254526, longitude: -97.1142843482076)
parkplant = ParkPlant.create( plant_id: plant3.id, park_id: park.id, diameter: 2, latitude: 49.876025652254526, longitude: -97.1142843482076)

puts "Created #{Family.count} Families"
puts "Created #{Genus.count} Genera"
puts "Created #{Plant.count} Plants"
puts "Created #{Park.count} Parks"
puts "Created #{ParkPlant.count} Park Plants"
