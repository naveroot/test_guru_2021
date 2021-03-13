# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@testguru.com'
  layout 'mailer'
end
