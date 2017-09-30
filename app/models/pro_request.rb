class ProRequest < ApplicationRecord
  # == Constants =============================================================
  MAILCHIMP_LIST_ID = 'dd6bd967d7'.freeze
  PHONE_REGEXP = /\A(\+\d+)?([\s\-\.]?\(?\d+\)?)+\z/
  # == Attributes ============================================================
  # == Extensions ============================================================
  # == Relationships =========================================================
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
  # == Scopes ================================================================
  # == Callbacks =============================================================
  after_create :subscribe_to_mailchimp
  # == Class Methods =========================================================
  # == Instance Methods ======================================================

  private

  def subscribe_to_mailchimp
    mailchimp_list_id = Rails.env.production? ? MAILCHIMP_LIST_ID : ENV['MAILCHIMP_LIST_ID']
    merge_fields = {
      FNAME: first_name,
      LNAME: last_name,
      COMPANY: company
    }
    MailchimpSubscribeJob.perform_now(email, mailchimp_list_id, merge_fields)
  end
end
