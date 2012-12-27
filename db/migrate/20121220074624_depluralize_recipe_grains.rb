class DepluralizeRecipeGrains < ActiveRecord::Migration
 def change
  rename_table :recipe_grains, :recipe_grain
 end
end
