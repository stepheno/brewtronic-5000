class ReportingController < ApplicationController
  def ttb
    
  end

  def grain
    start_date = params[:start_date]
    end_date = params[:end_date]
    @grain_received_totals = self.transactable_usage(start_date, end_date, GrainTransaction, :grain, "amount > 0")
    @grain_used_totals = self.transactable_usage(start_date, end_date, GrainTransaction, :grain, "amount < 0")
  end

  def hop
  end

  def fermenter
  end

  # Takes a date range and a model to operate on, returning the amount used/received
  def transactable_usage(start_date, end_date, model, foreign_model, conditional, item = nil)
    amounts = model.where(:created_at => start_date..end_date).where(conditional)
    amounts.reduce({}) do |totals, transactable|
      totals[transactable.send foreign_model] = totals[transactable.send foreign_model].to_i + transactable.total_amount
      totals
    end
  end
end
