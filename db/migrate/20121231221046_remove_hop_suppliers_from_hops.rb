class RemoveHopSuppliersFromHops < ActiveRecord::Migration
  def change
    remove_column :hops, :hop_supplier
    remove_index :hops, :hop_supplier_id
  end
end
