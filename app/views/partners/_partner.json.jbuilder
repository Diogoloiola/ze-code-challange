json.extract! partner, :id, :trading_name, :owner_name
json.coverage_area partner.parse_coordinates

json.address do
  json.type partner.addresses.first.type_address
  json.coordinates [partner.addresses.first.latitude.to_f, partner.addresses.first.longitude.to_f]
end
