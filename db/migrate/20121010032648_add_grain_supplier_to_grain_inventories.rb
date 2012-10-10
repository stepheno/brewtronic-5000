class AddGrainSupplierToGrainInventories < ActiveRecord::Migration
  def change
    add_column :grain_inventories, :grain_supplier_id, :integer
    add_index  :grain_inventories, :grain_supplier_id
  end
end
