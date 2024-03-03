class UniqueVisit < ApplicationRecord
  scope :today, -> { where(period: 'day') }
  scope :total, -> { where(period: 'total') }
end
