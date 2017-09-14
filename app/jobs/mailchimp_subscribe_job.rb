class MailchimpSubscribeJob < ApplicationJob
  queue_as :default

  def perform(email, mailchimp_list_id, merge_fields = {})
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    gibbon.lists(mailchimp_list_id).members.create(
      body: {
        email_address: email,
        status: 'subscribed',
        merge_fields: merge_fields
      }
    )
  rescue Gibbon::MailChimpError => e
    if e.title == 'Member Exists'
      return logger.error("Gibbon::MailChimpError #{e.message}")
    end
    raise
  end
end
