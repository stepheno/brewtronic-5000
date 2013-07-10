class HopTransactionsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /hop_transactions
  # GET /hop_transactions.json
  def index
    @hop_transactions = HopTransaction.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /hop_transactions/1
  # GET /hop_transactions/1.json
  def show
    @hop_transaction = HopTransaction.find(params[:id])
  end

  # GET /hop_transactions/new
  # GET /hop_transactions/new.json
  def new
    @hop_transaction = HopTransaction.new
  end

  # GET /hop_transactions/1/edit
  def edit
    @hop_transaction = HopTransaction.find(params[:id])
    @hop_transaction.amount = Units.format_mass_for_user(@hop_transaction.amount, current_user).value
  end

  # POST /hop_transactions
  # POST /hop_transactions.json
  def create
    params[:hop_transaction][:amount] = Units.convert_mass_units(params[:hop_transaction][:amount],params[:hop_transaction][:unit])

    ht_params = params[:hop_transaction] #get the grain transaction parameters
    if params[:is_hop_contract] == "true"
      hop_contract = HopContract.find(ht_params[:hop_contract_id])
      if not hop_contract.nil?
        ht_params[:hop_id] = hop_contract.hop.id
        ht_params[:hop_supplier_id] = hop_contract.hop_supplier.id
        ht_params[:hop_year] = hop_contract.harvest_date.year
        ht_params[:hop_type] = hop_contract.hop_type
      end
    else  # not a hop contract
      ht_params[:hop_contract_id] = nil
    end

    @hop_transaction = HopTransaction.new(ht_params)
    @hop_transaction.hop_inventory = HopInventory.where(:hop_id => @hop_transaction.hop_id).where(:crop_year => @hop_transaction.hop_year).where(:hop_supplier_id => @hop_transaction.hop_supplier_id).first

    respond_to do |format|
      if @hop_transaction.save
        @hop_transaction.modify_inventory

        format.html { redirect_to action: "index" and flash[:notice] = "Hop Transaction #{@hop_transaction.hop.name unless @hop_transaction.hop.nil?}:#{@hop_transaction.hop_supplier.name unless @hop_transaction.hop_supplier.nil?} was successfully created." }
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
    params[:hop_transaction][:amount] = Units.convert_mass_units(params[:hop_transaction][:amount],params[:hop_transaction][:unit])
    ht_params = params[:hop_transaction] #get the grain transaction parameters
    if not ht_params[:hop_contract_id].nil?
      hop_contract = HopContract.find(ht_params[:hop_contract_id])
      if not hop_contract.nil?
        ht_params[:hop_id] = hop_contract.hop.id
        ht_params[:hop_supplier_id] = hop_contract.hop_supplier.id
        ht_params[:hop_year] = hop_contract.harvest_date.year
        ht_params[:hop_type] = hop_contract.hop_type
      end
    end

    @hop_transaction = HopTransaction.find(params[:id])
    old_total = @hop_transaction.total_amount
    params[:hop_transaction][:hop_inventory_id] = @hop_transaction.hop_inventory_id

    respond_to do |format|
      if @hop_transaction.update_attributes(params[:hop_transaction])
        new_total = @hop_transaction.total_amount
        @hop_transaction.hop_inventory.amount = @hop_transaction.hop_inventory.amount + (new_total-old_total)
        @hop_transaction.hop_inventory.save

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

  def model
    HopTransaction
  end

  def default_sort_column
    "hop_id"
  end

  def hop_contract_form
    respond_to do |format|
      format.js { render 'hop_contract' }
    end
  end

  def hop_manual_entry_form
    respond_to do |format|
      format.js { render 'hop_manual_entry' }
    end
  end

end
