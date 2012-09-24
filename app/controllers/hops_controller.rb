class HopsController < ApplicationController
  # GET /hops
  # GET /hops.json
  def index
    @hops = Hop.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hops }
    end
  end

  # GET /hops/1
  # GET /hops/1.json
  def show
    @hop = Hop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hop }
    end
  end

  # GET /hops/new
  # GET /hops/new.json
  def new
    @hop = Hop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hop }
    end
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
        format.html { redirect_to @hop, notice: 'Hop was successfully created.' }
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
end
