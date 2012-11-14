class HopTransactionsController < ApplicationController
  # GET /hop_transactions
  # GET /hop_transactions.json
  def index
    @hop_transactions = HopTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hop_transactions }
    end
  end

  # GET /hop_transactions/1
  # GET /hop_transactions/1.json
  def show
    @hop_transaction = HopTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hop_transaction }
    end
  end

  # GET /hop_transactions/new
  # GET /hop_transactions/new.json
  def new
    @hop_transaction = HopTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hop_transaction }
    end
  end

  # GET /hop_transactions/1/edit
  def edit
    @hop_transaction = HopTransaction.find(params[:id])
  end

  # POST /hop_transactions
  # POST /hop_transactions.json
  def create
    params[:hop_transaction][:unit_amount] = Units.convert_units(params[:hop_transaction][:unit_amount],params[:hop_transaction][:unit])

    @hop_transaction = HopTransaction.new(params[:hop_transaction])

    respond_to do |format|
      if @hop_transaction.save
        format.html { redirect_to @hop_transaction, notice: 'Hop transaction was successfully created.' }
        format.json { render json: @hop_transaction, status: :created, location: @hop_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @hop_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hop_transactions/1
  # PUT /hop_transactions/1.json
  def update
    params[:hop_transaction][:unit_amount] = Units.convert_units(params[:hop_transaction][:unit_amount],params[:hop_transaction][:unit])
    @hop_transaction = HopTransaction.find(params[:id])

    respond_to do |format|
      if @hop_transaction.update_attributes(params[:hop_transaction])
        format.html { redirect_to @hop_transaction, notice: 'Hop transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hop_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hop_transactions/1
  # DELETE /hop_transactions/1.json
  def destroy
    @hop_transaction = HopTransaction.find(params[:id])
    @hop_transaction.destroy

    respond_to do |format|
      format.html { redirect_to hop_transactions_url }
      format.json { head :no_content }
    end
  end
  
end
