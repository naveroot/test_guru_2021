# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :authenticate_user!

  private

  def authenticate_user!
    cookies[:reqested_path] = request.fullpath
    redirect_to login_path unless current_user
    flash[:allert] = 'Access denied. Please login or signup first/'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
