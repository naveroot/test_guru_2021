# frozen_string_literal: true

class TestsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_test, only: %i[destroy start]
  before_action :find_user, only: :start

  def index
    @tests = Test.all
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = current_user
  end
end
