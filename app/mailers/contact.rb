class Contact < ActionMailer::Base
  default from: "dave@datildave.com"
  default to: "dave@datildave.com"

  def new_message(message)
    @message = message

    mail(subject: "[Datil Dave Contact]: #{message.subject}")
  end

  def new_order_confirmation(order)
    @order = order

    mail(to: order.customer_email, subject: "DatilDave.com Order Confirmation")
  end

  def new_order(order)
    @order = order

    mail(subject: "New order for DatilDave.com")
  end
end
