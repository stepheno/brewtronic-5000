class HopSuppliersController < ApplicationController
  # GET /hop_suppliers
  # GET /hop_suppliers.json
  def index
    @hop_suppliers = HopSupplier.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hop_suppliers }
    end
  end

  # GET /hop_suppliers/1
  # GET /hop_suppliers/1.json
  def show
    @hop_supplier = HopSupplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hop_supplier }
    end
  end

  # GET /hop_suppliers/new
  # GET /hop_suppliers/new.json
  def new
    @hop_supplier = HopSupplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hop_supplier }
    end
  end

  # GET /hop_suppliers/1/edit
  def edit
    @hop_supplier = HopSupplier.find(params[:id])
  end

  # POST /hop_suppliers
  # POST /hop_suppliers.json
  def create
    @hop_supplier = HopSupplier.new(params[:hop_supplier])

    respond_to do |format|
      if @hop_supplier.save
        format.html { redirect_to @hop_supplier, notice: 'Hop supplier was successfully created.' }
        format.json { render json: @hop_supplier, status: :created, location: @hop_supplier }
      else
        format.html { render action: "new" }
        format.json { render json: @hop_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hop_suppliers/1
  # PUT /hop_suppliers/1.json
  def update
    @hop_supplier = HopSupplier.find(params[:id])

    respond_to do |format|
      if @hop_supplier.update_attributes(params[:hop_supplier])
        format.html { redirect_to @hop_supplier, notice: 'Hop supplier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hop_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hop_suppliers/1
  # DELETE /hop_suppliers/1.json
  def destroy
    @hop_supplier = HopSupplier.find(params[:id])
    @hop_supplier.destroy

    respond_to do |format|
      format.html { redirect_to hop_suppliers_url }
      format.json { head :no_content }
    end
  end
end
