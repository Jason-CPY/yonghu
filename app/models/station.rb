class Station < ApplicationRecord
  has_one :address, as: :addressable

  has_and_belongs_to_many :couriers

  belongs_to :city

  def to_s
    self.name
  end
end