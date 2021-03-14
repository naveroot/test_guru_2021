# frozen_string_literal: true

module AnswersHelper
  def answers_actions(answer)
    tag.span(class: 'action-buttons') do
      concat link_to 'Edit', edit_admin_answer_path(answer)
      concat link_to 'Delete', admin_answer_path(answer), method: :delete, data: { confirm: 'Are you sure?' }
    end
  end

  def answer_presentation(answer)
    tag.div(class: "block #{background_color(answer)}") do
      concat tag.strong link_to answer.body, admin_answer_path(answer)
      concat tag.p answers_actions(answer)
    end
  end

  private

  def background_color(answer)
    if admin?
      answer.correct? ? 'bg-green' : 'bg-red'
    else
      ''
    end
  end

  def admin?
    controller.class.name.split('::').first == 'Admin'
  end
end
