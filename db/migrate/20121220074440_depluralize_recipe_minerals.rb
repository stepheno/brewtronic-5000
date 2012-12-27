class DepluralizeRecipeMinerals < ActiveRecord::Migration
 def change
  rename_table :recipe_minerals, :recipe_mineral
 end
end
