class AddBarcodenumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :barcode_number, :string
    add_index :users, :barcode_number, unique: true
  end
end
