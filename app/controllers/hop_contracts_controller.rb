class HopContractsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /hop_contracts
  # GET /hop_contracts.json
  def index
    @hop_contracts = HopContract.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
    end

  # GET /hop_contracts/1
  # GET /hop_contracts/1.json
  def show
    @hop_contract = HopContract.find(params[:id])
    end

  # GET /hop_contracts/new
  # GET /hop_contracts/new.json
  def new
    @hop_contract = HopContract.new
    end

  # GET /hop_contracts/1/edit
  def edit
    @hop_contract = HopContract.find(params[:id])
    @hop_contract.contract_amount = Units.format_mass_for_user(@hop_contract.contract_amount, current_user).value
    @hop_contract.used_amount = Units.format_mass_for_user(@hop_contract.used_amount, current_user).value
  end

  # POST /hop_contracts
  # POST /hop_contracts.json
  def create
    params[:hop_contract][:contract_amount] = Units.convert_mass_units(params[:hop_contract][:contract_amount],params[:hop_contract][:contract_amount_unit])
    params[:hop_contract][:used_amount] = Units.convert_mass_units(params[:hop_contract][:used_amount],params[:hop_contract][:used_amount_unit])
    @hop_contract = HopContract.new(params[:hop_contract])

    respond_to do |format|
      if @hop_contract.save
        format.html { redirect_to action: "index" and flash[:notice] = "Hop contract #{@hop_contract.hop.name}:#{@hop_contract.hop_supplier.name} created." }
        format.json { render json: @hop_contract, status: :created, location: @hop_contract }
      else
        format.html { render action: "new" }
        format.json { render json: @hop_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hop_contracts/1
  # PUT /hop_contracts/1.json
  def update
    params[:hop_contract][:contract_amount] = Units.convert_mass_units(params[:hop_contract][:contract_amount],params[:hop_contract][:contract_amount_unit])
    params[:hop_contract][:used_amount] = Units.convert_mass_units(params[:hop_contract][:used_amount],params[:hop_contract][:used_amount_unit])

    @hop_contract = HopContract.find(params[:id])

    respond_to do |format|
      if @hop_contract.update_attributes(params[:hop_contract])
        format.html { redirect_to @hop_contract, notice: 'Hop contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hop_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hop_contracts/1
  # DELETE /hop_contracts/1.json
  def destroy
    @hop_contract = HopContract.find(params[:id])
    @hop_contract.destroy

    respond_to do |format|
      format.html { redirect_to hop_contracts_url }
      format.json { head :no_content }
    end
  end

  def model
    HopContract
  end

  def default_sort_column
    "hop_supplier_id"
  end

end
