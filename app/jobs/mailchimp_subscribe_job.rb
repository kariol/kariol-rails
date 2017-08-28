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
  end
end
