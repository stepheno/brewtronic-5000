class StylesController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /styles
  # GET /styles.json

  def index
    @styles = Style.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.js
      format.json { render :json => Style.where("name like ?", "%#{params[:term]}%").map(&:attributes) }
    end
  end

  # GET /styles/1
  # GET /styles/1.json
  def show
    @style = Style.find(params[:id])
  end

  # GET /styles/new
  # GET /styles/new.json
  def new
    @style = Style.new
  end

  # GET /styles/1/edit
  def edit
    @style = Style.find(params[:id])
    @style.og_range_low = Units.format_density_for_user(@style.og_range_low,current_user)
    @style.og_range_high = Units.format_density_for_user(@style.og_range_high,current_user)
    @style.fg_range_low = Units.format_density_for_user(@style.fg_range_low,current_user)
    @style.fg_range_high = Units.format_density_for_user(@style.fg_range_high,current_user)
  end

  # POST /styles
  # POST /styles.json
  def create
    style = convert_units(params[:style])
    @style = Style.new(style)

    respond_to do |format|
      if @style.save
        format.html { redirect_to action: "index" and flash[:notice] = "Style #{@style.name} successfully created." }
        format.json { render json: @style, status: :created, location: @style }
      else
        format.html { render action: "new" }
        format.json { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /styles/1
  # PUT /styles/1.json
  def update
    @style = Style.find(params[:id])
    style = convert_units(params[:style])

    respond_to do |format|
      if @style.update_attributes(style)
        format.html { redirect_to @style, notice: 'Style was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /styles/1
  # DELETE /styles/1.json
  def destroy
    @style = Style.find(params[:id])
    @style.destroy

    respond_to do |format|
      format.html { redirect_to styles_url }
      format.json { head :no_content }
    end
  end

  def model
    Style
  end

  def convert_units(style)
    style[:og_range_low] = Units.convert_density_units(style[:og_range_low],style[:og_low_density_unit])
    style[:og_range_high] = Units.convert_density_units(style[:og_range_high],style[:og_high_density_unit])
    style[:fg_range_low] = Units.convert_density_units(style[:fg_range_low],style[:fg_low_density_unit])
    style[:fg_range_high] = Units.convert_density_units(style[:fg_range_high],style[:fg_high_density_unit])
    style
  end

end
