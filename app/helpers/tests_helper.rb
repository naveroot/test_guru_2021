# frozen_string_literal: true

module TestsHelper
  def test_actions(test)
    content_tag(:span, class: 'action-buttons') do
      concat button_to 'Start', start_test_path(test), disabled: !user_signed_in?
      if user_signed_in? && current_user.admin?
        concat link_to 'Edit', edit_admin_test_path(test)
        concat link_to 'Delete', admin_test_path(test), method: :delete, data: { confirm: 'Are you sure?' }
      end
    end
  end
end
