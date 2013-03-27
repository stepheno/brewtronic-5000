class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @batches = Batch.all
    respond_to do |format|
      format.html
      format.js
    end
  end
end
