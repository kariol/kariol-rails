class MailchimpSubscribeJob < ApplicationJob
  queue_as :default

  def perform(email, mailchimp_list_id)
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    gibbon.lists(mailchimp_list_id).members.create(
      body: {
        email_address: email,
        status: 'subscribed'
        # merge_fields: {
        #   FNAME: @user.first_name,
        #   LNAME: @user.last_name
        # }
      }
    )
  rescue Gibbon::MailChimpError => exception
    return if exception.title == 'Member Exists'
    Rails.logger.error("Gibbon::MailChimp failed: #{exception.detail}")
  end
end
