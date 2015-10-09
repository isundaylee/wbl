class ApplicationMailer < ActionMailer::Base
  default from: 'WBL Notifications <notifications@mitwbl.org>'
  layout 'mailer'
end
