class UserMailer < ActionMailer::Base
  default from: "bray21345@gmail.com"

  def welcome_email(user)
    @user = user
    @url = url_for(@user)
    mail(to: @user.email, subject: 'Welcome to IgniteBot!')
  end
end
