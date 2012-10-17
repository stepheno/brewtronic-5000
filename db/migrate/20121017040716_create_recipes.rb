class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :style
      t.float :target_og
      t.float :target_fg
      t.float :size
      t.references :yeast
      t.references :minerals
      t.references :grains
      t.references :hops
      t.references :mash_steps
      t.float :boil_time
      t.float :ibu
      t.float :abv
      t.float :srm
      t.float :pitch_temperature

      t.timestamps
    end
    add_index :recipes, :yeast_id
    add_index :recipes, :minerals_id
    add_index :recipes, :grains_id
    add_index :recipes, :hops_id
    add_index :recipes, :mash_steps_id
    add_index :recipes, :style_id
  end
end
