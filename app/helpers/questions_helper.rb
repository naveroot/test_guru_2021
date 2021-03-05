module QuestionsHelper
  def question_header(question)
    edit_message = "Edit #{question.body} Question"
    new_message = "Create New #{question.test.title} Question"
    question.persisted? ?  edit_message : new_message
  end
end
