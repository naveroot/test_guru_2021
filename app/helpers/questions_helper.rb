module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.body} Question"
    else
      "Create New #{question.test.title} Question"
    end
  end
end
