require 'tlsmail'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Pedidos::Application.initialize!

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address            => 'smtp.gmail.com',
  :port               => 587,
  :tls                  => true,
  :domain             => 'gmail.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => 'diego.nudler@gmail.com',
  :password           => 'jul1eta2'
}

my_date_formats = { :default => '%d/%m/%Y' }
Time::DATE_FORMATS.merge!(my_date_formats)
Date::DATE_FORMATS.merge!(my_date_formats)

