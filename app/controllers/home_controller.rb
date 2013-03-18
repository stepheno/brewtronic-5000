class HomeController < ApplicationController
  def index
    @batches = Batch.all
  end
end
