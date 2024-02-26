class Category < ApplicationRecord
  has_many :actualities
  has_many :events
  has_many :associations
  has_many :cities
end
