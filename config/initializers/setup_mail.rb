ActionMailer::Base.smtp_settings = {
  :address              => "smtp.office365.com",
  :port                 => 587,
  :domain               => "my1040academy.com",
  :user_name            => ENV['info@my1040academy.com'],
  :password             => ENV['XBNJ7BY4Gd!'],
  :authentication       => :login,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "my1040academy.com"