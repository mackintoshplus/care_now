class CreateEntryLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_logs do |t|
      t.string :barcode
      t.datetime :entry_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
