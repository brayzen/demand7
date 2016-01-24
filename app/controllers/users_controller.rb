class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:id])
    if @user.save
      flash[:notice] = "You've successfully signed up, enjoy!"
      UserMailer.welcome_email(@user).deliver
    else
      redirect_to :new
    end
  end
end
