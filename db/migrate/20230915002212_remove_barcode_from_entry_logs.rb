class RemoveBarcodeFromEntryLogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :entry_logs, :barcode, :string
  end
end
