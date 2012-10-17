class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :category
      t.integer :sub_category
      t.float :og_range_low
      t.float :og_range_high
      t.float :fg_range_low
      t.float :fg_range_high
      t.float :ibu_range_low
      t.float :ibu_range_high
      t.float :srm_range_low
      t.float :srm_range_high

      t.timestamps
    end
  end
end
