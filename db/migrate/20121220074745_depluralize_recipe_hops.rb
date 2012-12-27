class DepluralizeRecipeHops< ActiveRecord::Migration
 def change
  rename_table :recipe_hops, :recipe_hop
 end
end
