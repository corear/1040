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
    attachments["512.png"] = File.read("#{Rails.root}/public/512.png")
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Registered")
  end
end
