class HomeController < ApplicationController
  require 'send_mail'
  require 'suppression_list'
  require 'previously_sent_mails'

  def welcome
    if params["p_email"]
      resp = ::PreviouslySentMails.get_resp(params["p_email"])
      @resp = resp.to_h
    end
  end

  def sendmail
    resp = ::SendMail.call(params["email"],params["subject"],params["description"],params["campaign_id"])
    flash[:notice] = "Mail sent successfully"
    redirect_to root_url
  end

  def suppression_list
    resp = ::SuppressionList.exists(params["email"])
    puts resp
    if resp
      flash[:error] = "Exist in suppression list"
    else
      flash[:notice] = "Doesnot exist in suppression list"
    end
    redirect_to root_url
  end

  def previously_sent_mails
    resp = ::PreviouslySentMails.get_resp(params["email"])
    resp = resp.to_h
    redirect_to root_url
  end
end
