class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def send_simple_message
    RestClient.post "https://api:key-db5b8bf8152c756163aab413bb1b325f"\
      "@api.mailgun.net/v3/sandboxeefb68eda94c488ba22420dd410ae2f8.mailgun.org/messages",
      :from => "Divya B S <postmaster@sandboxeefb68eda94c488ba22420dd410ae2f8.mailgun.org>",
      :to => "divya <divya@yopmail.com>",
      :subject => "Hello divya",
      :text => "Congratulations divya"
  end

  RestClient.get "https://api:key-db5b8bf8152c756163aab413bb1b325f"\
    "@api.mailgun.net/v3/sandboxeefb68eda94c488ba22420dd410ae2f8.mailgun.org/bounces/divya1@yopmail.com"


  RestClient.get "https://api:key-db5b8bf8152c756163aab413bb1b325f"\
    "@api.mailgun.net/v3/sandboxeefb68eda94c488ba22420dd410ae2f8.mailgun.org/events/divya1@yopmail.com"

end
