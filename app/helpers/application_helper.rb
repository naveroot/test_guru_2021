# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url
    link_to 'GitHub', 'https://github.com/naveroot/test_guru_2021', target: '_blank', rel: 'nofollow'
  end

  def flash_messages
    html = flash.collect { |key, message| content_tag(:p, message, class: "flash #{key}") }
    safe_join(html)
  end

  def welcome_message
    content_tag(:h4, "Welcome #{current_user.username}[#{current_user.email}] guru!") if current_user
  end

  def navbar_links
    content_tag(:ul, class: 'nav') do
      if current_user
        concat content_tag(:li)
        concat content_tag(:li, link_to('Log Out', destroy_user_session_path, method: :delete))
        concat content_tag(:li, link_to('Tests', tests_path))
        concat content_tag(:li, link_to('AdminPanel', admin_tests_path)) if current_user.admin?
      else
        concat content_tag(:li, link_to('logIn', new_user_session_path))
        concat content_tag(:li, link_to('SignUP', new_user_registration_path))
      end
    end
  end
end
