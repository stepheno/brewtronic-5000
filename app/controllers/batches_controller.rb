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

  # GET /batches/1/duplicate
  def duplicate
    @prev_batch = Batch.find(params[:id])
    @batch = @prev_batch.dup  
  end

  # GET /batches/1/edit
  def edit
    @batch = Batch.find(params[:id])
    @batch.yield = Units.format_volume_for_user(@batch.yield, current_user).value
    @batch.original_gravity = Units.format_density_for_user(@batch.original_gravity, current_user)
    @batch.finish_gravity = Units.format_density_for_user(@batch.finish_gravity, current_user)
  end

  # POST /batches
  # POST /batches.json
  def create
    #params[:batch][:yield] = Units.convert_volume_units(params[:batch][:yield],params[:batch][:volume_unit])
    #params[:batch][:original_gravity] = Units.convert_density_units(params[:batch][:original_gravity],params[:batch][:og_density_unit])
    #params[:batch][:finish_gravity] = Units.convert_density_units(params[:batch][:finish_gravity],params[:batch][:fg_density_unit])
    @batch = Batch.new(params[:batch])

    respond_to do |format|
      if @batch.save
#        recipe = Recipe.find(params[:batch][:recipe_id])
#        if not recipe.nil?
#          recipe.recipe_grains.each do |grain|
#            g = GrainTransaction.create(:grain_id => grain.grain.id,
#                :grain_supplier_id => grain.grain.grain_supplier.id,
#                :amount => -grain.amount,
#                :quantity => 1)
#            g.modify_inventory
#            g.save!
#          end
#          recipe.recipe_hops.each do |hop|
#            h = HopTransaction.create(:hop_id => hop.hop.id,
#                :hop_supplier_id => hop.hop.hop_supplier_id,
#                :hop_type => hop.hop_type,
#                :amount => -hop.amount,
#                :quantity => 1,
#                :hop_year => hop.hop.year)
#            h.modify_inventory
#            h.save!
#          end
#        end
        format.html { redirect_to batch_steps_path(:id => @batch.id) }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { redirect_to batch_steps_path(:id => @batch.id) }
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
        recipe = Recipe.find(params[:batch][:recipe_id])
        if not recipe.nil?
          recipe.recipe_grains.each do |grain|
            g = GrainTransaction.create(:grain_id => grain.grain.id, :grain_supplier_id => grain.grain.grain_supplier.id, :amount => -grain.amount, :quantity => 1)
            g.save!
          end
          recipe.recipe_hops.each do |hop|
            h = HopTransaction.create(:hop_id => hop.hop.id, :hop_supplier_id => hop.hop.hop_supplier_id, :amount => -hop.amount, :quantity => 1, :hop_year => hop.hop.year)
            h.save!
          end
        end

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
