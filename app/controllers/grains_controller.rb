class GrainsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /grains
  # GET /grains.json
  def index
    params[:q] = params[:term] unless params[:term].nil?
    @grains = Grain.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
    respond_to do |format|
     format.html
     format.js
     format.json { render :json => Grain.where("name like ?", "%#{params[:q]}%").map { |x| x.attributes.merge(:name => x.display_name) } }
    end
  end

  # GET /grains/1
  # GET /grains/1.json
  def show
    @grain = Grain.find(params[:id])
  end

  # GET /grains/new
  # GET /grains/new.json
  def new
    @grain = Grain.new
  end

  # GET /grains/1/edit
  def edit
    @grain = Grain.find(params[:id])
  end

  # POST /grains
  # POST /grains.json
  def create
    @grain = Grain.new(params[:grain])

    respond_to do |format|
      if @grain.save
        format.html { redirect_to @grain, notice: 'Grain was successfully created.' }
        format.json { render json: @grain, status: :created, location: @grain }
      else
        format.html { render action: "new" }
        format.json { render json: @grain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grains/1
  # PUT /grains/1.json
  def update
    @grain = Grain.find(params[:id])

    respond_to do |format|
      if @grain.update_attributes(params[:grain])
        format.html { redirect_to @grain, notice: 'Grain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grains/1
  # DELETE /grains/1.json
  def destroy
    @grain = Grain.find(params[:id])
    @grain.destroy

    respond_to do |format|
      format.html { redirect_to grains_url }
      format.json { head :no_content }
    end
  end

  def model
    Grain
  end

end
