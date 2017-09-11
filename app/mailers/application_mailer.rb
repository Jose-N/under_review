class ApplicationMailer < ActionMailer::Base
  default from: "\"under_review\" <no-reply@example.com>"
  layout 'mailer'
end
