class ReportingController < ApplicationController
  def ttb
    
  end

  def grain
    start_date = params[:start_date]
    end_date = params[:end_date]

    grains_received = GrainTransaction.where(:created_at => start_date..end_date).where("amount > 0")
    @grain_received_totals = {}
    grains_received.map {|grain_transaction| @grain_received_totals[grain_transaction.grain] = @grain_received_totals[grain_transaction.grain].to_i + grain_transaction.total_amount }

    grains_used = GrainTransaction.where(:created_at => start_date..end_date).where("amount < 0")
    @grain_used_totals = {}
    grains_used.map {|grain_transaction| @grain_used_totals[grain_transaction.grain] = @grain_used_totals[grain_transaction.grain].to_i + grain_transaction.total_amount }
  end

  def hop
  end

  def fermenter
  end
end
