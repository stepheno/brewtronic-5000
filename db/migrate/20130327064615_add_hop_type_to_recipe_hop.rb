class AddHopTypeToRecipeHop < ActiveRecord::Migration
  def change
    add_column :recipe_hops, :hop_type, :string
  end
end
