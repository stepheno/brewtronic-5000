class MineralsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /minerals
  # GET /minerals.json
  def index
    params[:q] = params[:term] unless params[:term].nil?
    @minerals = Mineral.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
    respond_to do |format|
     format.html
     format.js
     format.json { render :json => Mineral.where("name like ?", "%#{params[:q]}%").map(&:attributes) }
    end

  end

  # GET /minerals/1
  # GET /minerals/1.json
  def show
    @mineral = Mineral.find(params[:id])
  end

  # GET /minerals/new
  # GET /minerals/new.json
  def new
    @mineral = Mineral.new
  end

  # GET /minerals/1/edit
  def edit
    @mineral = Mineral.find(params[:id])
  end

  # POST /minerals
  # POST /minerals.json
  def create
    @mineral = Mineral.new(params[:mineral])

    respond_to do |format|
      if @mineral.save
        format.html { redirect_to action: "index" and flash[:notice] = "Mineral #{@mineral.name} successfully created." }
        format.json { render json: @mineral, status: :created, location: @mineral }
      else
        format.html { render action: "new" }
        format.json { render json: @mineral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /minerals/1
  # PUT /minerals/1.json
  def update
    @mineral = Mineral.find(params[:id])

    respond_to do |format|
      if @mineral.update_attributes(params[:mineral])
        format.html { redirect_to @mineral, notice: 'Mineral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mineral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minerals/1
  # DELETE /minerals/1.json
  def destroy
    @mineral = Mineral.find(params[:id])
    @mineral.destroy

    respond_to do |format|
      format.html { redirect_to minerals_url }
      format.json { head :no_content }
    end
  end

  def model
    Mineral
  end

end
