require 'byebug'

full_path_json = Rails.root.join('db/mocks/data.json')

partners = JSON.parse(File.read(full_path_json))

puts 'IMPORTANDO DADOS'

partners['pdvs'].each do |partner|
  Partner.create!(
    trading_name: partner['tradingName'],
    owner_name: partner['ownerName'],
    document: partner['document'],
    coverage_area: partner['coverageArea'],
    addresses_attributes: [
      type_address: partner['address']['type'],
      coordinates: partner['address']['coordinates']
    ]
  )
end

puts 'DADOS IMPORTADOS'
