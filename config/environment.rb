# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.server_settings = {
    :address        => 'smtpout.secureserver.net',
    :port           => '80',
    :authentication => :login,
    :user_name      => ENV['info@my1040academy.com'],
    :password       => ENV['XBNJ7BY4Gd!'],
    :domain         => 'www.my1040academy.com',
      :openssl_verify_mode => 'none',
    :enable_starttls_auto => true
}