class SendMail
  def SendMail.call(to, subject, text, campaign_id)
    puts "coming"
    message_params =  {
      from: "Divya B S <postmaster@sandboxeefb68eda94c488ba22420dd410ae2f8.mailgun.org>",
      to:   to,
      subject: subject,
      text: text,
      'o:campaign' => campaign_id
    }
    MGCLIENT.send_message MAILGUN_DOMAIN, message_params
  end
end
