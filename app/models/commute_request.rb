class CommuteRequest < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :origin, class_name: 'Address'
  belongs_to :destination, class_name: 'Address'

  accepts_nested_attributes_for :origin
  accepts_nested_attributes_for :destination

  # == Validations ==========================================================
  validates :arrival_time, presence: true
  validates :email,
            presence: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: I18n.t('errors.messages.not_a_valid_email')
            }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
