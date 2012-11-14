class HopInventoriesController < ApplicationController
  # GET /hop_inventories
  # GET /hop_inventories.json
  def index
    @hop_inventories = HopInventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hop_inventories }
    end
  end

  # GET /hop_inventories/1
  # GET /hop_inventories/1.json
  def show
    @hop_inventory = HopInventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hop_inventory }
    end
  end

  # GET /hop_inventories/new
  # GET /hop_inventories/new.json
  def new
    @hop_inventory = HopInventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hop_inventory }
    end
  end

  # GET /hop_inventories/1/edit
  def edit
    @hop_inventory = HopInventory.find(params[:id])
  end

  # POST /hop_inventories
  # POST /hop_inventories.json
  def create
     params[:hop_inventory][:amount] = convert_units(params[:hop_inventory][:amount],params[:hop_inventory][:unit])

    @hop_inventory = HopInventory.new(params[:hop_inventory])

    respond_to do |format|
      if @hop_inventory.save
        format.html { redirect_to @hop_inventory, notice: 'Hop inventory was successfully created.' }
        format.json { render json: @hop_inventory, status: :created, location: @hop_inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @hop_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hop_inventories/1
  # PUT /hop_inventories/1.json
  def update
    params[:hop_inventory][:amount] = convert_units(params[:hop_inventory][:amount],params[:hop_inventory][:unit])
    @hop_inventory = HopInventory.find(params[:id])

    respond_to do |format|
      if @hop_inventory.update_attributes(params[:hop_inventory])
        format.html { redirect_to @hop_inventory, notice: 'Hop inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hop_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hop_inventories/1
  # DELETE /hop_inventories/1.json
  def destroy
    @hop_inventory = HopInventory.find(params[:id])
    @hop_inventory.destroy

    respond_to do |format|
      format.html { redirect_to hop_inventories_url }
      format.json { head :no_content }
    end
  end

  def convert_units(amount, unit)
    case unit
      when "lb" 
        amount.to_f.lb.to_kg.value
      when "g" 
        amount.to_f.g.to_kg.value
      when "oz" 
        amount.to_f.oz.to_kg.value
      when "kg"
        amount
      else
        raise "Unkown unit"
    end
  end

end
