class QuestionsController < ApplicationController
    before_action :find_question, only: %i[show destroy]
    before_action :find_test, only: %i[index new create]
  
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found
  
    def index
      @questions = @test.questions
      responce = ["Questions for test \"#{@test.title}\":\n"]
      @questions.each_with_index { |question, index| responce << "#{index + 1}.  #{question.body}\n" }
      render plain: responce.join
    end
  
    def show
      render plain: @question.body
    end
  
    def new
      @question =  @test.questions.new
    end
  
    def create
      @question = @test.questions.new(question_params)
      if @question.save
        redirect_to test_questions_path(@question.test)
      else
        render plain: "Some error"
      end
  end


  def destroy
    @question.destroy!
    redirect_to test_questions_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
