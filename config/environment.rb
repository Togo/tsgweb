# Load the rails application
require File.expand_path('../application', __FILE__)

config.action_mailer.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address  => "smtp.tsgtrippstadt.info",
  :port  => 25,
  :user_name  => "info@tsgtrippstadt.info",
  :password  => "gvVRZXLBLACyD5BJ",
  :authentication  => :login
}
config.action_mailer.raise_delivery_errors = true

# Initialize the rails application
Tsgweb::Application.initialize!
