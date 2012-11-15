class Contact < ActionMailer::Base
  default from: "dan@datildave.com"
  default to: "dan@datildave.com"

  def new_message(message)
    @message = message

    mail(:subject => "[Datil Dave Contact]: #{message.subject}")
  end
  
end
