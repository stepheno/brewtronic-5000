class ReportingController < ApplicationController
  def ttb
    
  end

  def grain
    start_date = params[:start_date]
    end_date = params[:end_date]
    @grain_received_totals = self.grain_received(start_date, end_date)
    @grain_used_totals = self.grain_used(start_date, end_date)
  end

  def hop
  end

  def fermenter
  end

  def grain_received(start_date, end_date, grain = nil)
    grains_received = GrainTransaction.where(:created_at => start_date..end_date).where("amount > 0")
    grains_received.reduce({}) do |totals, grain_transaction|
      totals[grain_transaction.grain] = totals[grain_transaction.grain].to_i + grain_transaction.total_amount
      totals
    end
  end

  def grain_used(start_date, end_date, grain = nil)
    grains_used = GrainTransaction.where(:created_at => start_date..end_date).where("amount < 0")
    grains_used.reduce({}) do |totals, grain_transaction|
      totals[grain_transaction.grain] = totals[grain_transaction.grain].to_i + grain_transaction.total_amount
      totals
    end
  end
end
