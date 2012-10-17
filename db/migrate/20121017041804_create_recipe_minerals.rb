class CreateRecipeMinerals < ActiveRecord::Migration
  def change
    create_table :recipe_minerals do |t|
      t.references :recipe
      t.references :mineral
      t.float :amount

      t.timestamps
    end

    add_index :recipe_minerals, :recipe_id
    add_index :recipe_minerals, :mineral_id
  end
end
