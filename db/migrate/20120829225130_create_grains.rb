class CreateGrains < ActiveRecord::Migration
  def change
    create_table :grains do |t|
      t.string :name
      t.float :extract_potential
      t.float :color

      t.timestamps
    end
  end
end
