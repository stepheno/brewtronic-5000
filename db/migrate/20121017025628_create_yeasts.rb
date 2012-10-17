class CreateYeasts < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.references :manufacturer
      t.string :name
      t.string :yeast_type
      t.float :efficiency

      t.timestamps

    end
      
    add_index :yeasts, :manufacturer_id
  end
end
