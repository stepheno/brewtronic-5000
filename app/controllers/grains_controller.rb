class GrainsController < ApplicationController
  # GET /grains
  # GET /grains.json
  def index
    @grains = Grain.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grains }
    end
  end

  # GET /grains/1
  # GET /grains/1.json
  def show
    @grain = Grain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grain }
    end
  end

  # GET /grains/new
  # GET /grains/new.json
  def new
    @grain = Grain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grain }
    end
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
end
