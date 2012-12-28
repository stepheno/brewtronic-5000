class RepluralizeRecipeComponents < ActiveRecord::Migration
  def change
    rename_table :recipe_mineral, :recipe_minerals
    rename_table :recipe_hop, :recipe_hops
    rename_table :recipe_grain, :recipe_grains
    rename_table :recipe_mash, :recipe_mashes
  end
end
