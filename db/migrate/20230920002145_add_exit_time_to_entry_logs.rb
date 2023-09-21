class AddExitTimeToEntryLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :entry_logs, :exit_time, :datetime
  end
end
