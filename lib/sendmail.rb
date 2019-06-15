require 'mail'
require 'dotenv/load'

module Sendmail
  def send_message(mail_to, mail_subject, mail_body)

    mail_from   = ENV['MAIL_ADDRESS']
    mail_passwd = ENV['MAIL_PASSWD']

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.gmail.com',
        :port => 587,
        :domain => 'example.com',
        :user_name => "#{mail_from}",
        :password => "#{mail_passwd}",
        :authentication => :login,
        :enable_starttls_auto => true
      }
    end

    m = Mail.new do
      from "#{mail_from}"
      to "#{mail_to}"
      subject "#{mail_subject}"
      body "#{mail_body}"
    end

    m.charset = "UTF-8"
    m.content_transfer_encoding = "8bit"
    m.deliver
  end

  module_function :send_message
end
