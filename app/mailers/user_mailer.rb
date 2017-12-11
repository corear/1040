class UserMailer < ApplicationMailer
  default from: "info@my1040academy.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject: "hi"
  end
end
