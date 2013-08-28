class ReportingController < ApplicationController
  def ttb
    start_date = params[:start_date]
    end_date = params[:end_date]
    @grain_received_totals = self.transactable_usage(start_date, end_date, GrainTransaction, :grain, :created_at, :total_amount, "amount > 0")
    @grain_used_totals = self.transactable_usage(start_date, end_date, GrainTransaction, :grain, :created_at, :total_amount, "amount < 0")
    @hop_received_totals = self.transactable_usage(start_date, end_date, HopTransaction, :hop, :created_at, :total_amount, "amount > 0")
    @hop_used_totals = self.transactable_usage(start_date, end_date, HopTransaction, :hop, :created_at, :total_amount, "amount < 0")
    @batch_totals = self.transactable_usage(start_date, end_date, Batch, :recipe, :target_date, :yield, nil)
  end

  def grain
    start_date = params[:start_date]
    end_date = params[:end_date]
    @grain_received_totals = self.transactable_usage(start_date, end_date, GrainTransaction, :grain, :created_at, :total_amount, "amount > 0")
    @grain_used_totals = self.transactable_usage(start_date, end_date, GrainTransaction, :grain, :created_at, :total_amount, "amount < 0")
  end

  def hop
    start_date = params[:start_date]
    end_date = params[:end_date]
    @hop_received_totals = self.transactable_usage(start_date, end_date, HopTransaction, :hop, :created_at, :total_amount, "amount > 0")
    @hop_used_totals = self.transactable_usage(start_date, end_date, HopTransaction, :hop, :created_at, :total_amount, "amount < 0")
  end

  def fermenter
  end

  # Takes a date range and a model to operate on, returning the amount used/received
  def transactable_usage(start_date, end_date, model, foreign_model, date_field,amount_field, conditional, item = nil)
    amounts = model.where(date_field => start_date..end_date).where(conditional)
    amounts.reduce({}) do |totals, transactable|
      totals[transactable.send foreign_model] = totals[transactable.send foreign_model].to_i + transactable.send(amount_field)
      totals
    end
  end
end
