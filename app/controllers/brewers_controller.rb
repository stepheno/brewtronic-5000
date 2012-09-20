class BrewersController < ApplicationController
  # GET /brewers
  # GET /brewers.json
  def index
    @brewers = Brewer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brewers }
    end
  end

  # GET /brewers/1
  # GET /brewers/1.json
  def show
    @brewer = Brewer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brewer }
    end
  end

  # GET /brewers/new
  # GET /brewers/new.json
  def new
    @brewer = Brewer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brewer }
    end
  end

  # GET /brewers/1/edit
  def edit
    @brewer = Brewer.find(params[:id])
  end

  # POST /brewers
  # POST /brewers.json
  def create
    @brewer = Brewer.new(params[:brewer])

    respond_to do |format|
      if @brewer.save
        format.html { redirect_to @brewer, notice: 'Brewer was successfully created.' }
        format.json { render json: @brewer, status: :created, location: @brewer }
      else
        format.html { render action: "new" }
        format.json { render json: @brewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brewers/1
  # PUT /brewers/1.json
  def update
    @brewer = Brewer.find(params[:id])

    respond_to do |format|
      if @brewer.update_attributes(params[:brewer])
        format.html { redirect_to @brewer, notice: 'Brewer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brewers/1
  # DELETE /brewers/1.json
  def destroy
    @brewer = Brewer.find(params[:id])
    @brewer.destroy

    respond_to do |format|
      format.html { redirect_to brewers_url }
      format.json { head :no_content }
    end
  end
end
