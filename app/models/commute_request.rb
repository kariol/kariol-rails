class CommuteRequest < ApplicationRecord
  # == Constants =============================================================
  ARRIVAL_TIMES = %w[07h00 07h30 08h00 08h30 09h00 09h30].freeze
  MAILCHIMP_LIST_ID = '220c70f97c'.freeze
  # == Attributes ============================================================
  # == Extensions ============================================================
  # == Relationships =========================================================
  belongs_to :origin, class_name: 'Address'
  belongs_to :destination, class_name: 'Address'

  accepts_nested_attributes_for :origin
  accepts_nested_attributes_for :destination
  # == Validations ===========================================================
  validates :arrival_time, presence: true
  validates :email,
            presence: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: I18n.t('errors.messages.not_a_valid_email')
            }
  # == Scopes ================================================================
  # == Callbacks =============================================================
  after_create :subscribe_to_mailchimp
  # == Class Methods =========================================================
  # == Instance Methods ======================================================

  private

  def subscribe_to_mailchimp
    mailchimp_list_id = Rails.env.production? ? MAILCHIMP_LIST_ID : ENV['MAILCHIMP_LIST_ID']
    MailchimpSubscribeJob.perform_later(email, mailchimp_list_id)
  end
end
