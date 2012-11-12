class UsersController < ApplicationController
  expose(:user)

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, notice: "User successfully created."
    else
      render 'new'
    end
  end
end
