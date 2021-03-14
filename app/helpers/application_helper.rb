# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url
    link_to 'GitHub', 'https://github.com/naveroot/test_guru_2021', target: '_blank', rel: 'nofollow noopener'
  end

  def flash_messages
    html = flash.collect { |key, message| tag.p(message, class: "flash #{key}") }
    safe_join(html)
  end

  def navbar_links
    tag.ul(class: 'nav') do
      if current_user
        concat tag.li(welcome_message)
        concat tag.li(link_to('Log Out', destroy_user_session_path, method: :delete))
        concat tag.li(link_to('Tests', tests_path))
        concat tag.li(link_to('AdminPanel', admin_tests_path)) if current_user.admin?
      else
        concat tag.li(link_to('logIn', new_user_session_path))
        concat tag.li(link_to('SignUP', new_user_registration_path))
      end
    end
  end

  private

  def welcome_message
    tag.h4("Welcome #{current_user.username}[#{current_user.email}] guru!", class: 'welcome_message')
  end
end
