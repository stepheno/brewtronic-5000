class AddStorageFactorsToHopInventory < ActiveRecord::Migration
  def change
    add_column :hop_inventories, :storage_temp, :float
    add_column :hop_inventories, :storage_factor, :float
    add_column :hop_inventories, :harvest_date, :date
  end
end
