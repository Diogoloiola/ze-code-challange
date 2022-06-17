class FixColumnNameTypeInAdress < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :type, :type_address
  end
end
