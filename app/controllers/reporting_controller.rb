class ReportingController < ApplicationController
  def ttb
    
  end

  def grain
    start_date = params[:start_date]
    end_date = params[:end_date]
    @grains = GrainTransaction.where(:created_at => start_date..end_date)
  end

  def hop
  end

  def fermenter
  end
end
