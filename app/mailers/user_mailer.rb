class UserMailer < ActionMailer::Base
  default :from => "nanditaa@outlook.com"

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
    end
end