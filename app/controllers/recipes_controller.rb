class RecipesController < ApplicationController
  include SortableController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/duplicate
  # Bryan wrote this from scratch, so be HIGHLY suspicous of it.
  def duplicate
    @prev_recipe = Recipe.find(params[:id])
    @recipe = @prev_recipe.dup  
    @recipe.name = @prev_recipe.name + " (duplicate)"
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe.size = Units.format_volume_for_user(@recipe.size, current_user).value
    @recipe.pitch_temperature = Units.format_temp_for_user(@recipe.pitch_temperature, current_user).value
    @recipe.target_og = Units.format_density_for_user(@recipe.target_og, current_user)
    @recipe.target_fg = Units.format_density_for_user(@recipe.target_fg, current_user)
    @recipe.recipe_grains.each {|grain| grain.amount = Units.format_mass_for_user(grain.amount,current_user).value }
    @recipe.recipe_hops.each {|hop| hop.amount = Units.format_mass_for_user(hop.amount,current_user).value }
    @recipe.recipe_minerals.each {|mineral| mineral.amount = Units.format_mass_for_user(mineral.amount,current_user).value }
    @recipe.recipe_mashes.each {|mash| mash.temperature= Units.format_temp_for_user(mash.temperature,current_user).value }
  end

  # POST /recipes
  # POST /recipes.json
  def create
    recipe = convert_units(params[:recipe])

    @recipe = Recipe.new(recipe)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    recipe = convert_units(params[:recipe])

    respond_to do |format|
      if @recipe.update_attributes(recipe)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def model
    Recipe
  end

  def convert_units(recipe)
    recipe[:size] = Units.convert_volume_units(recipe[:size],recipe[:size_unit])
    recipe[:pitch_temperature] = Units.convert_temp_units(recipe[:pitch_temperature],recipe[:temp_unit])
    recipe[:target_fg] = Units.convert_density_units(recipe[:target_fg],recipe[:fg_density_unit])
    recipe[:target_og] = Units.convert_density_units(recipe[:target_og],recipe[:og_density_unit])

    recipe[:recipe_hops_attributes].map do |key,hop|
      hop[:amount] = Units.convert_mass_units(hop[:amount],hop[:unit])
      recipe[:recipe_hops_attributes][key] = hop 
    end unless recipe[:recipe_hops_attributes].nil?

    recipe[:recipe_grains_attributes].map do |key,grain|
      grain[:amount] = Units.convert_mass_units(grain[:amount],grain[:unit])
      recipe[:recipe_grains_attributes][key] = grain 
    end unless recipe[:recipe_grains_attributes].nil?

    recipe[:recipe_minerals_attributes].map do |key,mineral|
      mineral[:amount] = Units.convert_mass_units(mineral[:amount],mineral[:unit])
      recipe[:recipe_minerals_attributes][key] = mineral 
    end unless recipe[:recipe_minerals_attributes].nil?

    recipe[:recipe_mashes_attributes].map do |key,mash|
      mash[:temperature] = Units.convert_temp_units(mash[:temperature],mash[:unit])
      recipe[:recipe_mashes_attributes][key] = mash 
    end unless recipe[:recipe_mashes_attributes].nil?

    recipe
  end

end
