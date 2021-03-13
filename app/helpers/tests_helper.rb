# frozen_string_literal: true

module TestsHelper
  def test_actions(test)
    content_tag(:span, class: 'action-buttons') do
      concat link_to 'Show', test_path(test)
      if logged_in?
        concat link_to 'Edit', edit_test_path(test)
        concat link_to 'Show', test_path(test)
        concat link_to 'Delete', test_path(test), method: :delete, data: { confirm: 'Are you sure?' }
        concat button_to 'Start', start_test_path(test)
      end
    end
  end
end
