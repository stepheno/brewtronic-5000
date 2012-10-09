class RenameHopInventoryTypeColumn < ActiveRecord::Migration
  def up
  rename_column :hop_inventories, :type, :hop_type
  end

  def down
  rename_column :hop_inventories, :hop_type, :type
  end
end
