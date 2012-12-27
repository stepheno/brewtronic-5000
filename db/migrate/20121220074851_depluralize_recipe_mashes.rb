class DepluralizeRecipeMashes < ActiveRecord::Migration
 def change
  rename_table :recipe_mashes, :recipe_mash
 end
end
