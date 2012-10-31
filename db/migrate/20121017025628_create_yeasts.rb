class CreateYeasts < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.references :yeast_manufacturer
      t.string :name
      t.string :yeast_type
      t.float :efficiency

      t.timestamps

    end
      
    add_index :yeasts, :yeast_manufacturer_id
  end
end
