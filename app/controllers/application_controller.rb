class ApplicationController < ActionController::Base
  before_filter :set_user_time_zone
  protect_from_forgery

  def title(page_title)
    content_for(:title) { page_title }
  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end
end
