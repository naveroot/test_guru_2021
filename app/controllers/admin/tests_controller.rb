# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[start edit update destroy]

  def index
    @tests = Test.all
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy!
    redirect_to admin_tests_path
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      render :edit
    end
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = current_user
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end
end
