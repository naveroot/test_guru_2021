# frozen_string_literal: true

class TestMailer < ApplicationMailer
  def compleated_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: 'You just compleat test!'
  end
end
