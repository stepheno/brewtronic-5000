class YeastManufacturersController < ApplicationController
  # GET /yeast_manufacturers
  # GET /yeast_manufacturers.json
  def index
    @yeast_manufacturers = YeastManufacturer.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yeast_manufacturers }
    end
  end

  # GET /yeast_manufacturers/1
  # GET /yeast_manufacturers/1.json
  def show
    @yeast_manufacturer = YeastManufacturer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yeast_manufacturer }
    end
  end

  # GET /yeast_manufacturers/new
  # GET /yeast_manufacturers/new.json
  def new
    @yeast_manufacturer = YeastManufacturer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yeast_manufacturer }
    end
  end

  # GET /yeast_manufacturers/1/edit
  def edit
    @yeast_manufacturer = YeastManufacturer.find(params[:id])
  end

  # POST /yeast_manufacturers
  # POST /yeast_manufacturers.json
  def create
    @yeast_manufacturer = YeastManufacturer.new(params[:yeast_manufacturer])

    respond_to do |format|
      if @yeast_manufacturer.save
        format.html { redirect_to @yeast_manufacturer, notice: 'Yeast manufacturer was successfully created.' }
        format.json { render json: @yeast_manufacturer, status: :created, location: @yeast_manufacturer }
      else
        format.html { render action: "new" }
        format.json { render json: @yeast_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yeast_manufacturers/1
  # PUT /yeast_manufacturers/1.json
  def update
    @yeast_manufacturer = YeastManufacturer.find(params[:id])

    respond_to do |format|
      if @yeast_manufacturer.update_attributes(params[:yeast_manufacturer])
        format.html { redirect_to @yeast_manufacturer, notice: 'Yeast manufacturer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yeast_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yeast_manufacturers/1
  # DELETE /yeast_manufacturers/1.json
  def destroy
    @yeast_manufacturer = YeastManufacturer.find(params[:id])
    @yeast_manufacturer.destroy

    respond_to do |format|
      format.html { redirect_to yeast_manufacturers_url }
      format.json { head :no_content }
    end
  end
end
