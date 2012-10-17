class MashTypesController < ApplicationController
  # GET /mash_types
  # GET /mash_types.json
  def index
    @mash_types = MashType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mash_types }
    end
  end

  # GET /mash_types/1
  # GET /mash_types/1.json
  def show
    @mash_type = MashType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mash_type }
    end
  end

  # GET /mash_types/new
  # GET /mash_types/new.json
  def new
    @mash_type = MashType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mash_type }
    end
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
        format.html { redirect_to @mash_type, notice: 'Mash type was successfully created.' }
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
end
