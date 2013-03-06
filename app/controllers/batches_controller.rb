class BatchesController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    @batch = Batch.find(params[:id])
  end

  # GET /batches/new
  # GET /batches/new.json
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
    @batch = Batch.find(params[:id])
    @batch.yield = Units.format_volume_for_user(@batch.yield, current_user).value
  end

  # POST /batches
  # POST /batches.json
  def create
    params[:batch][:yield] = Units.convert_volume_units(params[:batch][:yield],params[:batch][:volume_unit])
    params[:batch][:original_gravity] = Units.convert_density_units(params[:batch][:original_gravity],params[:batch][:og_density_unit])
    params[:batch][:finish_gravity] = Units.convert_density_units(params[:batch][:finish_gravity],params[:batch][:fg_density_unit])
    @batch = Batch.new(params[:batch])

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { render action: "new" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /batches/1
  # PUT /batches/1.json
  def update
    params[:batch][:yield] = Units.convert_volume_units(params[:batch][:yield],params[:batch][:volume_unit])
    params[:batch][:original_gravity] = Units.convert_density_units(params[:batch][:original_gravity],params[:batch][:og_density_unit])
    params[:batch][:finish_gravity] = Units.convert_density_units(params[:batch][:finish_gravity],params[:batch][:fg_density_unit])
    @batch = Batch.find(params[:id])

    respond_to do |format|
      if @batch.update_attributes(params[:batch])
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url }
      format.json { head :no_content }
    end
  end

  def model
    Batch
  end

  def default_sort_column
    "recipe_id"
  end
end
