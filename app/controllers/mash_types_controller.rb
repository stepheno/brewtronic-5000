class MashTypesController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /mash_types
  # GET /mash_types.json
  def index
    params[:q] = params[:term] unless params[:term].nil?
    @mash_types = MashType.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
    respond_to do |format|
     format.html
     format.js
     format.json { render :json => MashType.where("name like ?", "%#{params[:q]}%").map(&:attributes) }
    end
  end

  # GET /mash_types/1
  # GET /mash_types/1.json
  def show
    @mash_type = MashType.find(params[:id])
  end

  # GET /mash_types/new
  # GET /mash_types/new.json
  def new
    @mash_type = MashType.new
  end

  # GET /mash_types/1/edit
  def edit
    @mash_type = MashType.find(params[:id])
  end

  # POST /mash_types
  # POST /mash_types.json
  def create
    @mash_type = MashType.new(params[:mash_type])

    respond_to do |format|
      if @mash_type.save
        format.html { redirect_to action: "index" and flash[:notice] = "Mash type #{@mash_type.name} successfully created." }
        format.json { render json: @mash_type, status: :created, location: @mash_type }
      else
        format.html { render action: "new" }
        format.json { render json: @mash_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mash_types/1
  # PUT /mash_types/1.json
  def update
    @mash_type = MashType.find(params[:id])

    respond_to do |format|
      if @mash_type.update_attributes(params[:mash_type])
        format.html { redirect_to @mash_type, notice: 'Mash type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mash_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mash_types/1
  # DELETE /mash_types/1.json
  def destroy
    @mash_type = MashType.find(params[:id])
    @mash_type.destroy

    respond_to do |format|
      format.html { redirect_to mash_types_url }
      format.json { head :no_content }
    end
  end

  def model
    MashType
  end

end
