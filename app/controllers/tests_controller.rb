class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy!
    redirect_to tests_path
  end
end
