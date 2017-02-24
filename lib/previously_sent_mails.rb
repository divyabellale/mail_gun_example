class PreviouslySentMails
  def PreviouslySentMails.get_resp(email)
    MGCLIENT.get("#{MAILGUN_DOMAIN}/events", { event: 'delivered', to: email,limit: 2 })
  end
end
