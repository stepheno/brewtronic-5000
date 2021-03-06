class GrainInventoriesController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /grain_inventories
  # GET /grain_inventories.json
  def index
    @grain_inventories= GrainInventory.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /grain_inventories/1
  # GET /grain_inventories/1.json
  def show
    @grain_inventory = GrainInventory.find(params[:id])
  end

  # GET /grain_inventories/new
  # GET /grain_inventories/new.json
  def new
    @grain_inventory = GrainInventory.new
  end

  # GET /grain_inventories/1/edit
  def edit
    @grain_inventory = GrainInventory.find(params[:id])
    @grain_inventory.amount = Units.format_mass_for_user(@grain_inventory.amount, current_user).value
  end

  # POST /grain_inventories
  # POST /grain_inventories.json
  def create
    params[:grain_inventory][:amount] = Units.convert_mass_units(params[:grain_inventory][:amount],params[:grain_inventory][:unit])

    @grain_inventory = GrainInventory.new(params[:grain_inventory])
    respond_to do |format|
      if @grain_inventory.save
        format.html { redirect_to @grain_inventory, notice: 'Grain inventory was successfully created.' }
        format.json { render json: @grain_inventory, status: :created, location: @grain_inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @grain_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grain_inventories/1
  # PUT /grain_inventories/1.json
  def update
    params[:grain_inventory][:amount] = Units.convert_mass_units(params[:grain_inventory][:amount],params[:grain_inventory][:unit])
   
    @grain_inventory = GrainInventory.find(params[:id])
    respond_to do |format|
      if @grain_inventory.update_attributes(params[:grain_inventory])
        format.html { redirect_to @grain_inventory, notice: 'Grain inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grain_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grain_inventories/1
  # DELETE /grain_inventories/1.json
  def destroy
    @grain_inventory = GrainInventory.find(params[:id])
    @grain_inventory.destroy

    respond_to do |format|
      format.html { redirect_to grain_inventories_url }
      format.json { head :no_content }
    end
  end

  def model
    GrainInventory
  end

  def default_sort_column
    "grain_id"
  end
    
end
