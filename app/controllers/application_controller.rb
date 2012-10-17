class ApplicationController < ActionController::Base
  protect_from_forgery

  def title(page_title)
    content_for(:title) { page_title }
  end

end
