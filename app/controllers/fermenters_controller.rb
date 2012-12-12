class FermentersController < ApplicationController
  # GET /fermenters
  # GET /fermenters.json
  def index
    @fermenters = Fermenter.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fermenters }
    end
  end

  # GET /fermenters/1
  # GET /fermenters/1.json
  def show
    @fermenter = Fermenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fermenter }
    end
  end

  # GET /fermenters/new
  # GET /fermenters/new.json
  def new
    @fermenter = Fermenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fermenter }
    end
  end

  # GET /fermenters/1/edit
  def edit
    @fermenter = Fermenter.find(params[:id])
  end

  # POST /fermenters
  # POST /fermenters.json
  def create
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
end
