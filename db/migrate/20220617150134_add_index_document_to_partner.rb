class AddIndexDocumentToPartner < ActiveRecord::Migration[7.0]
  def change
    add_index :partners, :document, unique: true
  end
end
