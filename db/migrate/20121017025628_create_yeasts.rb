class CreateYeasts < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.string :name
      t.string :manufacturer
      t.string :yeast_type
      t.float :efficiency

      t.timestamps
    end
  end
end
