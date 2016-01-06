class ApplicationMailer < ActionMailer::Base
  default from: ENV["sendgrid_username"]
  layout 'mailer'
end
