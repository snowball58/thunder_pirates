# config/initializers/email_settings.rb
ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => 'gmail.com',
   :authentication => :login,
   :user_name => 'scottys.volunteer@gmail.com',
   :password => 'thunderpirates',
   :enable_starttls_auto => true
}