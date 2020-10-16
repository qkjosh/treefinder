require 'httparty'

WINNIPEG_PARKS_API = 'https://data.winnipeg.ca/resource/tx3d-pfxq.json'
WINNIPEG_TREES_API = 'https://data.winnipeg.ca/resource/hfwk-jp4h.json'
TREFLE_API = 'https://trefle.io/api/v1/species/search'

ParkPlant.destroy_all
Park.destroy_all
Plant.destroy_all
Genus.destroy_all
Family.destroy_all

parks_response = HTTParty.get(
  WINNIPEG_PARKS_API,
  query: {
    '$where': 'land_area_in_hectares > 2',
    '$limit': 20
  },
  body: {
    '$$apptoken': ENV['WINNIPEG_TOKEN'],
  }
)

parks_response.parsed_response.each do |park_data|
  park = Park.create(name: park_data['park_name'], latitude: park_data['location']['latitude'], longitude: park_data['location']['longitude'])

  trees_response = HTTParty.get(
    WINNIPEG_TREES_API,
    query: {
      'park': park['name']
    },
    body: {
      '$$apptoken': ENV['WINNIPEG_TOKEN'],
    }
  )

  trees_response.parsed_response.each do |tree_data|
    tree = Plant.find_or_create_by(common_name: tree_data['common_name'].titleize, scientific_name: tree_data['botanical_name']) do |tree|
      best_match = nil

      species_response = HTTParty.get(
        TREFLE_API,
        query: {
          'q': tree_data['botanical_name'].downcase.gsub(' spp.', ''),
          'token': ENV['TREFLE_TOKEN']
        }
      )
      best_match = species_response.parsed_response['data'][0]

      if best_match.nil?
        species_response = HTTParty.get(
          TREFLE_API,
          query: {
            'q': tree_data['common_name'].downcase.gsub(' species', ''),
            'token': ENV['TREFLE_TOKEN']
          }
        )
        best_match = species_response.parsed_response['data'][0]

        if best_match.nil?
          puts "No species found for: #{tree_data['botanical_name']} | #{tree_data['common_name']}"
          next
        end
      end

      if best_match
        # Continue creating genus and family, then update the plant
        family = Family.find_or_create_by(name: best_match['family'])
        genus = family.genera.find_or_create_by(name: best_match['genus'])
        tree.update(image_url: best_match['image_url'], genus_id: genus['id'], family_id: family['id'])
      end
    end

    ParkPlant.create(
      plant_id: tree['id'],
      park_id: park['id'],
      diameter: tree_data['diameter_at_breast_height'],
      latitude: tree_data['location']['latitude'],
      longitude: tree_data['location']['longitude']
    )

  end
end

puts "Created #{Family.count} Families"
puts "Created #{Genus.count} Genera"
puts "Created #{Plant.count} Plants"
puts "Created #{Park.count} Parks"
puts "Created #{ParkPlant.count} Park Plants"
