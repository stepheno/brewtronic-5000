class AddGrainSupplierToGrainInventories < ActiveRecord::Migration
  def change
    add_column :grain_inventories, :grain_supplier_id, :integer
  end
end
