class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to my app")do |format| format.html { render 'welcome_email' } end
  end
end
