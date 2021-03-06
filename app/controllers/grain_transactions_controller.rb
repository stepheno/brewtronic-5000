class GrainTransactionsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /grain_transactions
  # GET /grain_transactions.json
  def index
    @grain_transactions = GrainTransaction.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /grain_transactions/1
  # GET /grain_transactions/1.json
  def show
    @grain_transaction = GrainTransaction.find(params[:id])
  end

  # GET /grain_transactions/new
  # GET /grain_transactions/new.json
  def new
    @grain_transaction = GrainTransaction.new
  end

  # GET /grain_transactions/1/edit
  def edit
    @grain_transaction = GrainTransaction.find(params[:id])
    @grain_transaction.amount = Units.format_mass_for_user(@grain_transaction.amount, current_user).value
  end

  # POST /grain_transactions
  # POST /grain_transactions.json
  def create
    params[:grain_transaction][:amount] = Units.convert_mass_units(params[:grain_transaction][:amount],params[:grain_transaction][:unit])

    @grain_transaction = GrainTransaction.new(params[:grain_transaction])
    @grain_transaction.grain_inventory = GrainInventory.where(:grain_id => @grain_transaction.grain_id).where(:grain_supplier_id => @grain_transaction.grain_supplier_id).first
    gt_params = params[:grain_transaction] #get the grain transaction parameters
    respond_to do |format|
      if @grain_transaction.save
        @grain_transaction.modify_inventory
        format.html { redirect_to action: "index" and flash[:notice] = "Grain transaction #{@grain_transaction.grain.name}:#{@grain_transaction.grain_supplier.name} successfully created." } 
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
    old_total = @grain_transaction.total_amount

    params[:grain_transaction][:grain_inventory_id] = @grain_transaction.grain_inventory_id

    respond_to do |format|
      if @grain_transaction.update_attributes(params[:grain_transaction])
        new_total = @grain_transaction.total_amount
        @grain_transaction.grain_inventory.amount = @grain_transaction.grain_inventory.amount + (new_total-old_total)
        @grain_transaction.grain_inventory.save

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
