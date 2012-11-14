class Contact < ActionMailer::Base
  default from: "contact@datildave.com"
  default to: "dan.bearl@gmail.com"

  def new_message(message)
    @message = message

    mail(:subject => "[Datil Dave Contact]: #{message.subject}")
  end
  
end
