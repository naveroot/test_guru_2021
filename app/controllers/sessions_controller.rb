# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :welcome_message, username: current_user.username)
  end
end
