class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  default :from => "10/40 Entrepreneurship Academy <my1040academy@gmail.com>"
  
  def reset_password_instructions(record, token, opts={})
  @token = token
  devise_mail(record, :reset_password_instructions, opts)
  end 
  
  def signup_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Welcome, #{user.first_name}!", :reply_to => "info@my1040academy.com")
  end
  
  def signup_confirmation_admin(user)
    @user = user
    mail(:to => "Boss Man <info@my1040academy.com>", :subject => "🎉 New Registration from #{user.first_name} #{user.last_name}")
  end
  
  def two_week(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Two Week Email", :reply_to => "info@my1040academy.com")
  end
  
  def payment_change(user)
    @user = user
    mail(:to => "Boss Man <info@my1040academy.com>", :subject => "Request of Payment Change from #{user.first_name} #{user.last_name}", :reply_to => "#{user.email}")
  end
  
  def completed(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "🎉 You've Completed Our Course!", :reply_to => "info@my1040academy.com")
  end
  
  def enact_banhammer(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Account Temporarily Banned", :reply_to => "info@my1040academy.com")
  end
  
  def lift_banhammer(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Account Reinstated!", :reply_to => "info@my1040academy.com")
  end
  
end
