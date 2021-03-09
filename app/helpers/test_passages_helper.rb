# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    if test_passage.success?
      content_tag(:strong, 'You are PASS', class: 'green')
    else
      content_tag(:strong, 'You are FAIL', class: 'red')
    end
  end

  def question_pass_counter(test_passage)
    "[#{test_passage.current_question_number}/#{test_passage.total_question_number}]".html_safe
  end
end
