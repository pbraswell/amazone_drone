# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
AmazoneDrone::Application.initialize!

## [fix] - This NEEDS to go into Fiagaro / enviro settings!!!
ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SENDGRID_USERNAME"],
  :password => ENV["SENDGRID_PASSWORD"],
  :domain => 'peterbraswell.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
