class CreateHopContracts < ActiveRecord::Migration
  def change
    create_table :hop_contracts do |t|
      t.references :hop_supplier
      t.references :hop
      t.integer :hop_year
      t.float :contract_amount
      t.float :used_amount
      t.string :hop_type

      t.timestamps
    end
    add_index :hop_contracts, :hop_supplier_id
    add_index :hop_contracts, :hop_id
  end
end
