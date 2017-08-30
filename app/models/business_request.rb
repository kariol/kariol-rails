class BusinessRequest < ApplicationRecord
  # == Constants =============================================================
  EMPLOYEE_RANGES = [
    '1 à 10 employés',
    '10 à 50 employés',
    '50 à 200 employés',
    '200 à 500 employés',
    '500 à 1000 employés',
    'plus de 1000 employés'
  ].freeze
  MAILCHIMP_LIST_ID = 'b95371daa8'.freeze
  PHONE_REGEX = /\A(\+\d+)?([\s\-\.]?\(?\d+\)?)+\z/.freeze
  # == Attributes ============================================================
  # == Extensions ============================================================
  # == Relationships =========================================================
  belongs_to :address

  accepts_nested_attributes_for :address
  # == Validations ===========================================================
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: I18n.t('errors.messages.not_a_valid_email')
            }
  validates :phone,
            presence: true,
            format: {
              with: PHONE_REGEXP,
              message: I18n.t('errors.messages.not_a_valid_phone')
            }
  validates :company, presence: true
  validates :employee_range, presence: true, inclusion: { in: EMPLOYEE_RANGES }
  validates :message, presence: true
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
