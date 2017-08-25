class Address < ApplicationRecord
  validates :complete, presence: true

  geocoded_by :complete
  after_validation :geocode
end
