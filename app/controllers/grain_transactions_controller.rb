class GrainTransactionsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /grain_transactions
  # GET /grain_transactions.json
  def index
    @grain_transactions = GrainTransaction.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])

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
    gt_params = params[:grain_transaction] #get the grain transaction parameters
    respond_to do |format|
      if @grain_transaction.save

        grain_inventory = GrainInventory.where(:grain_id => gt_params[:grain_id]).where(:grain_supplier_id => gt_params[:grain_supplier_id]).first
        total_amount = Units.convert_mass_units(gt_params[:quantity].to_i * gt_params[:amount].to_f, gt_params[:unit])

        if (grain_inventory.nil?)
          grain_inventory = GrainInventory.create(:grain_id => gt_params[:grain_id], :grain_supplier_id => gt_params[:grain_supplier_id], :amount => total_amount)
        else
          grain_inventory.amount = grain_inventory.amount + total_amount
        end
        grain_inventory.save

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

  def model
    GrainTransaction
  end

  def default_sort_column
    "grain_id"
  end

end
