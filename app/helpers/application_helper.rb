# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url
    link_to 'GitHub', 'https://github.com/naveroot/test_guru_2021', target: '_blank', rel: 'nofollow'
  end

  def flash_messages
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end

  def welcome_message
    content_tag(:h4, "Welcome #{current_user.email} guru!") if current_user
  end

  def navbar_links
    content_tag(:ul, class: 'nav') do
      if current_user
        concat content_tag(:li)
        concat content_tag(:li, link_to('Log Out', logout_path))
        concat content_tag(:li, link_to('Tests', tests_path))
      else
        concat content_tag(:li, link_to('logIn', login_path))
        concat content_tag(:li, link_to('SignUP', login_path))
      end
    end
  end
end
