class GrainSuppliersController < ApplicationController
  # GET /grain_suppliers
  # GET /grain_suppliers.json
  def index
    @grain_suppliers = GrainSupplier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grain_suppliers }
    end
  end

  # GET /grain_suppliers/1
  # GET /grain_suppliers/1.json
  def show
    @grain_supplier = GrainSupplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grain_supplier }
    end
  end

  # GET /grain_suppliers/new
  # GET /grain_suppliers/new.json
  def new
    @grain_supplier = GrainSupplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grain_supplier }
    end
  end

  # GET /grain_suppliers/1/edit
  def edit
    @grain_supplier = GrainSupplier.find(params[:id])
  end

  # POST /grain_suppliers
  # POST /grain_suppliers.json
  def create
    @grain_supplier = GrainSupplier.new(params[:grain_supplier])

    respond_to do |format|
      if @grain_supplier.save
        format.html { redirect_to @grain_supplier, notice: 'Grain supplier was successfully created.' }
        format.json { render json: @grain_supplier, status: :created, location: @grain_supplier }
      else
        format.html { render action: "new" }
        format.json { render json: @grain_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grain_suppliers/1
  # PUT /grain_suppliers/1.json
  def update
    @grain_supplier = GrainSupplier.find(params[:id])

    respond_to do |format|
      if @grain_supplier.update_attributes(params[:grain_supplier])
        format.html { redirect_to @grain_supplier, notice: 'Grain supplier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grain_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grain_suppliers/1
  # DELETE /grain_suppliers/1.json
  def destroy
    @grain_supplier = GrainSupplier.find(params[:id])
    @grain_supplier.destroy

    respond_to do |format|
      format.html { redirect_to grain_suppliers_url }
      format.json { head :no_content }
    end
  end
end
