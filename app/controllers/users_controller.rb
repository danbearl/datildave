class UsersController < ApplicationController
  expose(:user)

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: "User successfully created."
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
