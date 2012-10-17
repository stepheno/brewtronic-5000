class CreateMinerals < ActiveRecord::Migration
  def change
    create_table :minerals do |t|
      t.string :name
      t.float :calcium
      t.float :magnesium
      t.float :sodium
      t.float :sulfate
      t.float :carbonate
      t.float :chloride

      t.timestamps
    end
  end
end
