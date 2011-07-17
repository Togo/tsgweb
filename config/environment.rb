# Load the rails application
require File.expand_path('../application', __FILE__)

config.action_mailer.raise_delivery_errors = true
config.action_mailer.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => ENV['m02081c5'],
  :password       => ENV['gvVRZXLBLACyD5BJ'],
  :domain         => ENV['tsgtrippstadt.info']
}

# Initialize the rails application
Tsgweb::Application.initialize!

