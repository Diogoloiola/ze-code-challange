class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :trading_name
      t.string :owner_name
      t.string :document
      t.text :coverage_area

      t.timestamps
    end
  end
end
