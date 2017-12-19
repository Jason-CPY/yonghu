class City < ApplicationRecord
  has_many :price_rules

  has_and_belongs_to_many :categories

  has_many :stations
  has_many :couriers
  has_many :users
end
