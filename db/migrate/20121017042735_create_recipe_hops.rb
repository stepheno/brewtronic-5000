class CreateRecipeHops < ActiveRecord::Migration
  def change
    create_table :recipe_hops do |t|
      t.references :recipe
      t.references :hop
      t.float :amount
      t.float :time
      t.string :location

      t.timestamps
    end
    add_index :recipe_hops, :recipe_id
    add_index :recipe_hops, :hop_id
  end
end
