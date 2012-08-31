class CreateGrainInventories < ActiveRecord::Migration
  def change
    create_table :grain_inventories do |t|
      t.float :amount

      t.timestamps
    end
  end
end
