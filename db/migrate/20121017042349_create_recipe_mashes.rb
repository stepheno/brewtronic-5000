class CreateRecipeMashes < ActiveRecord::Migration
  def change
    create_table :recipe_mashes do |t|
      t.references :recipe
      t.references :mash_type
      t.float :time
      t.float :temperature

      t.timestamps
    end
    add_index :recipe_mashes, :recipe_id
    add_index :recipe_mashes, :mash_type_id
  end
end
