ActiveRecord::Schema[7.0].define(version: 20_220_617_144_150) do
  create_table 'addresses', force: :cascade do |t|
    t.integer 'type_address'
    t.decimal 'latitude', precision: 10, scale: 6
    t.decimal 'longitude', precision: 10, scale: 6
    t.integer 'partner_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['partner_id'], name: 'index_addresses_on_partner_id'
  end

  create_table 'partners', force: :cascade do |t|
    t.string 'trading_name'
    t.string 'owner_name'
    t.string 'document'
    t.text 'coverage_area'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'addresses', 'partners'
end
