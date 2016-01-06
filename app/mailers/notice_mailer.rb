class NoticeMailer < ApplicationMailer
  
  default from: ENV["sendgrid_username"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.hello.subject
  #
  def hello(message)
    @message = message
    mail(to: ENV["GMAIL_ACCOUNT"], subject: '【ZO-SAN】お問い合わせあり')
  end
end
