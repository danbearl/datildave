class Contact < ActionMailer::Base
  default from: "dave@datildave.com"
  default to: "dave@datildave.com"

  def new_message(message)
    @message = message

    mail(:subject => "[Datil Dave Contact]: #{message.subject}")
  end
  
end
