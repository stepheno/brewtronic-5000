class CreateGrainInventories < ActiveRecord::Migration
  def change
    create_table :grain_inventories do |t|
      t.float :amount
      t.references :grain

      t.timestamps
    end

    add_index :grain_inventories, :grain_id
  end
end
