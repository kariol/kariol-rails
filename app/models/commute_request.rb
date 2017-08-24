class CommuteRequest < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================
  geocoded_by :origin, latitude: :origin_latitude, longitude: :origin_longitude
  geocoded_by :destination, latitude: :destination_latitude, longitude: :destination_longitude

  # == Relationships ========================================================

  # == Validations ==========================================================
  validates :origin, presence: true
  validates :destination, presence: true
  validates :arrival_time, presence: true
  validates :email, presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================
  after_validation :geocode, if: ->(obj) { obj.origin_changed? || obj.destination_changed? }

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
