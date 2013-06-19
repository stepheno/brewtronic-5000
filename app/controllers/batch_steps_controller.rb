class BatchStepsController < ApplicationController
  include Wicked::Wizard
  steps :recipe, :fermenter, :dates, :measurements

  def show
    @batch = Batch.find(params[:id])
    render_wizard
  end

  def update
    @batch = Batch.find(params[:id])
    @batch.attributes = params[:batch]
    render_wizard @batch
  end
end
