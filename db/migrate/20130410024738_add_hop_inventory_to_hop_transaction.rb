class AddHopInventoryToHopTransaction < ActiveRecord::Migration
  def change
    add_column :hop_transactions, :hop_inventory_id, :integer
  end
end
