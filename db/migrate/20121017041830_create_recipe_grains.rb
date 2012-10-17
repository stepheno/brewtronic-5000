class CreateRecipeGrains < ActiveRecord::Migration
  def change
    create_table :recipe_grains do |t|
      t.references :recipe
      t.references :grain
      t.float :amount

      t.timestamps
    end

    add_index :recipe_grains, :recipe_id
    add_index :recipe_grains, :grain_id
  end
end
