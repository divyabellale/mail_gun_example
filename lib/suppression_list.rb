class SuppressionList
  def SuppressionList.exists(email)
    MGCLIENT.get("#{MAILGUN_DOMAIN}/bounces/#{email}")
    true
  rescue => e
    false if /Address not found in bounces table/ =~ e.message
  end
end
