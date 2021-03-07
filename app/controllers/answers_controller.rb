 class AnswersController < ApplicationController
  before_action :find_answer, only: %i[ show edit update destroy ]
  before_action :find_question, only: %i[ new create ]

  def index
    @answers = Answer.all
  end


  def show
  end

  def new
    @answer = @question.answers.new
  end


  def edit
  end

  def create
    @answer =  @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: "Answer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: "Answer was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
    end
  end

  private

    def find_question
      @question = Question.find(params[:question_id])
    end

    def find_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
