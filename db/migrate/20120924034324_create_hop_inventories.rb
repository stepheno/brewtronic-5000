class CreateHopInventories < ActiveRecord::Migration
  def change
    create_table :hop_inventories do |t|
      t.references :hop
      t.references :hop_supplier
      t.integer :crop_year
      t.float :amount
      t.string :type

      t.timestamps
    end
    add_index :hop_inventories, :hop_id
    add_index :hop_inventories, :hop_supplier_id
  end
end
