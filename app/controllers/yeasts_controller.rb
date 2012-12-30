class YeastsController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /yeasts
  # GET /yeasts.json
  def index
    @yeasts = Yeast.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yeasts }
    end
  end

  # GET /yeasts/1
  # GET /yeasts/1.json
  def show
    @yeast = Yeast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yeast }
    end
  end

  # GET /yeasts/new
  # GET /yeasts/new.json
  def new
    @yeast = Yeast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yeast }
    end
  end

  # GET /yeasts/1/edit
  def edit
    @yeast = Yeast.find(params[:id])
  end

  # POST /yeasts
  # POST /yeasts.json
  def create
    @yeast = Yeast.new(params[:yeast])

    respond_to do |format|
      if @yeast.save
        format.html { redirect_to @yeast, notice: 'Yeast was successfully created.' }
        format.json { render json: @yeast, status: :created, location: @yeast }
      else
        format.html { render action: "new" }
        format.json { render json: @yeast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yeasts/1
  # PUT /yeasts/1.json
  def update
    @yeast = Yeast.find(params[:id])

    respond_to do |format|
      if @yeast.update_attributes(params[:yeast])
        format.html { redirect_to @yeast, notice: 'Yeast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yeast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yeasts/1
  # DELETE /yeasts/1.json
  def destroy
    @yeast = Yeast.find(params[:id])
    @yeast.destroy

    respond_to do |format|
      format.html { redirect_to yeasts_url }
      format.json { head :no_content }
    end
  end

  def model
    Yeast
  end

end
