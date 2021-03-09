# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage
  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.compleat?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def test_passage_params
    params.require(:test_passage).permit(:answers_ids)
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
