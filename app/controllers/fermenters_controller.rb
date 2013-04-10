class FermentersController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /fermenters
  # GET /fermenters.json
  def index
    @fermenters = Fermenter.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /fermenters/1
  # GET /fermenters/1.json
  def show
    @fermenter = Fermenter.find(params[:id])
    @batches = Batch.where(:fermenter_id => @fermenter.id).includes(:recipe).order("target_date DESC").limit 20
  end

  # GET /fermenters/new
  # GET /fermenters/new.json
  def new
    @fermenter = Fermenter.new
  end

  # GET /fermenters/1/edit
  def edit
    @fermenter = Fermenter.find(params[:id])
    @fermenter.size = Units.format_volume_for_user(@fermenter.size, current_user).value
  end

  # POST /fermenters
  # POST /fermenters.json
  def create
    params[:fermenter][:size] = Units.convert_volume_units(params[:fermenter][:size], params[:fermenter][:unit])
    @fermenter = Fermenter.new(params[:fermenter])

    respond_to do |format|
      if @fermenter.save
        format.html { redirect_to @fermenter, notice: 'Fermenter was successfully created.' }
        format.json { render json: @fermenter, status: :created, location: @fermenter }
      else
        format.html { render action: "new" }
        format.json { render json: @fermenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fermenters/1
  # PUT /fermenters/1.json
  def update
    params[:fermenter][:size] = Units.convert_volume_units(params[:fermenter][:size], params[:fermenter][:unit])
    @fermenter = Fermenter.find(params[:id])

    respond_to do |format|
      if @fermenter.update_attributes(params[:fermenter])
        format.html { redirect_to @fermenter, notice: 'Fermenter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fermenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fermenters/1
  # DELETE /fermenters/1.json
  def destroy
    @fermenter = Fermenter.find(params[:id])
    @fermenter.destroy

    respond_to do |format|
      format.html { redirect_to fermenters_url }
      format.json { head :no_content }
    end
  end

  def model
    Fermenter
  end

end
