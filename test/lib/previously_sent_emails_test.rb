require 'test_helper'
require_relative '../../lib/previously_sent_mails'

class PreviouslySentMailsTest < ActiveSupport::TestCase
  def setup
    @previously_sent_emails =
      PreviouslySentMails.new(MAILGUN_KEY, MAILGUN_DOMAIN)
  end

  test 'returns messages sent to an emails' do
    response =
      @previously_sent_emails.get(email: 'divya1@yopmail.com')

    # Assumption: As we have already sent(and keep on sending) many emails to mentioned emails
    assert_not_empty response.to_h['items']
  end

  test 'does not return messages sent to an email in supression list' do
    response =
      @previously_sent_emails.get(email: 'divya5@yopmail.com')

    # Assumption: We are already trying to send email to suppression list in SendTest
    assert_empty response.to_h['items']
  end
end
