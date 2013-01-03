class CreateHopsHopSuppliersTable < ActiveRecord::Migration
  def up
    create_table :hop_suppliers_hops, :id => false do |t|
      t.references :hop
      t.references :hop_supplier
    end
    add_index :hop_suppliers_hops, [:hop_id, :hop_supplier_id]
    add_index :hop_suppliers_hops, [:hop_supplier_id, :hop_id]
  end

  def down
    drop_table :hop_suppliers_hops
  end
end
