class CreateGrainSuppliersGrainsTable < ActiveRecord::Migration
  def up
    create_table :grain_suppliers_grains, :id => false do |t|
      t.references :grain
      t.references :grain_supplier
    end
    add_index :grain_suppliers_grains, [:grain_id, :grain_supplier_id]
    add_index :grain_suppliers_grains, [:grain_supplier_id, :grain_id]
  end

  def down
    drop_table :grain_suppliers_grains
  end
end
