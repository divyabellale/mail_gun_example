require 'test_helper'
require_relative '../../lib/send_mail'

class SendMailTest < ActiveSupport::TestCase
  def setup
    @client =
      SendMail.new(MAILGUN_KEY, MAILGUN_KEY)
  end

  test 'mail sent successfully' do
    response =
      @client.call(from: "Divya B S <postmaster@sandboxeefb68eda94c488ba22420dd410ae2f8.mailgun.org>",
                   to: 'divya2@yopmail.com', subject: 'Refactor',
                   text: 'The body', campaign_id: 1)
      assert_equal 'Queued. Thank you.', response.to_h['message']
  end
end
