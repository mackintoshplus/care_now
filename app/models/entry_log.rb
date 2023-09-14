class EntryLog < ApplicationRecord
  belongs_to :user

  validates :barcode, presence: true
  validates :entry_time, presence: true
end
