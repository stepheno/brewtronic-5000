class CreateGrainTransactions < ActiveRecord::Migration
  def change
    create_table :grain_transactions do |t|
      t.references :grain
      t.references :grain_supplier
      t.integer :quantity
      t.float :unit_amount

      t.timestamps
    end
    add_index :grain_transactions, :grain_id
    add_index :grain_transactions, :grain_supplier_id
  end
end
