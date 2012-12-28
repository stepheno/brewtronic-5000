class RemoveReferencesToRecipeComponentsFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :minerals
    remove_column :recipes, :hops
    remove_column :recipes, :grains
    remove_column :recipes, :mashes
    remove_index :recipes, :minerals_id
    remove_index :recipes, :grains_id
    remove_index :recipes, :hops_id
    remove_index :recipes, :mash_steps_id
  end
end
