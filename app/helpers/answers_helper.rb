# frozen_string_literal: true

module AnswersHelper
  def answers_actions(answer)
    content_tag(:span, class: 'action-buttons') do
      concat link_to 'Edit', edit_admin_answer_path(answer)
      concat link_to 'Delete', admin_answer_path(answer), method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
