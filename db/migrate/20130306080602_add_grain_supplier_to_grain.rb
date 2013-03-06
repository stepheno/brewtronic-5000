class AddGrainSupplierToGrain < ActiveRecord::Migration
  def change
    add_column :grains, :grain_supplier_id, :integer
    add_index  :grains, :grain_supplier_id
  end
end
