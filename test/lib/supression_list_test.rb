require 'test_helper'
require_relative '../../lib/suppression_list'

class SupressionListTest < ActiveSupport::TestCase
  def setup
    @supression_list =
      SuppressionList.new(MAILGUN_KEY, MAILGUN_KEY)
  end

  test 'detects an email id in a suppression list' do
    assert @supression_list.exists?(email: 'divya@yopmail.com')
  end

  test 'detects if an email id is NOT listed in a suppression list' do
    assert_not @supression_list.exists?(email: 'divya1@yopmail.com')
  end
end
