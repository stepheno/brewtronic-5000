class AddGrainInventoryToGrainTransaction < ActiveRecord::Migration
  def change
    add_column :grain_transactions, :grain_inventory_id, :integer
  end
end
