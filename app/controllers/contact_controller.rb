class ContactController < ApplicationController
  expose(:pages)
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      Contact.new_message(@message).deliver

      redirect_to :root, notice: "Message successfully sent."
    else
      flash.now.alert = "Please fill in all fields correctly."
      render "new"
    end
  end

end
