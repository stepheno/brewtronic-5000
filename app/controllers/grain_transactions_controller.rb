class GrainTransactionsController < ApplicationController
  # GET /grain_transactions
  # GET /grain_transactions.json
  def index
    @grain_transactions = GrainTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grain_transactions }
    end
  end

  # GET /grain_transactions/1
  # GET /grain_transactions/1.json
  def show
    @grain_transaction = GrainTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grain_transaction }
    end
  end

  # GET /grain_transactions/new
  # GET /grain_transactions/new.json
  def new
    @grain_transaction = GrainTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grain_transaction }
    end
  end

  # GET /grain_transactions/1/edit
  def edit
    @grain_transaction = GrainTransaction.find(params[:id])
  end

  # POST /grain_transactions
  # POST /grain_transactions.json
  def create
    @grain_transaction = GrainTransaction.new(params[:grain_transaction])

    respond_to do |format|
      if @grain_transaction.save
        format.html { redirect_to @grain_transaction, notice: 'Grain transaction was successfully created.' }
        format.json { render json: @grain_transaction, status: :created, location: @grain_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @grain_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grain_transactions/1
  # PUT /grain_transactions/1.json
  def update
    @grain_transaction = GrainTransaction.find(params[:id])

    respond_to do |format|
      if @grain_transaction.update_attributes(params[:grain_transaction])
        format.html { redirect_to @grain_transaction, notice: 'Grain transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grain_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grain_transactions/1
  # DELETE /grain_transactions/1.json
  def destroy
    @grain_transaction = GrainTransaction.find(params[:id])
    @grain_transaction.destroy

    respond_to do |format|
      format.html { redirect_to grain_transactions_url }
      format.json { head :no_content }
    end
  end
end