class CreateHopTransactions < ActiveRecord::Migration
  def change
    create_table :hop_transactions do |t|
      t.references :hop
      t.references :hop_supplier
      t.integer :quantity
      t.float :unit_amount

      t.timestamps
    end
    add_index :hop_transactions, :hop_id
    add_index :hop_transactions, :hop_supplier_id
  end
end
