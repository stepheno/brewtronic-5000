class HopsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /hops
  # GET /hops.json
  def index
    @hops = Hop.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /hops/1
  # GET /hops/1.json
  def show
    @hop = Hop.find(params[:id])
  end

  # GET /hops/new
  # GET /hops/new.json
  def new
    @hop = Hop.new
  end

  # GET /hops/1/edit
  def edit
    @hop = Hop.find(params[:id])
  end

  # POST /hops
  # POST /hops.json
  def create
    @hop = Hop.new(params[:hop])

    respond_to do |format|
      if @hop.save
        format.html { redirect_to action: "index" and flash[:notice] = "Hop #{@hop.name} was successfully created." }
        format.json { render json: @hop, status: :created, location: @hop }
      else
        format.html { render action: "new" }
        format.json { render json: @hop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hops/1
  # PUT /hops/1.json
  def update
    @hop = Hop.find(params[:id])

    respond_to do |format|
      if @hop.update_attributes(params[:hop])
        format.html { redirect_to @hop, notice: 'Hop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hops/1
  # DELETE /hops/1.json
  def destroy
    @hop = Hop.find(params[:id])
    @hop.destroy

    respond_to do |format|
      format.html { redirect_to hops_url }
      format.json { head :no_content }
    end
  end

  def model
    Hop
  end

end
