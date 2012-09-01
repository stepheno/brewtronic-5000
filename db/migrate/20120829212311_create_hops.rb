class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.string :name
      t.float :alpha
      t.references :hop_supplier

      t.timestamps
    end

    add_index :hops, :hop_supplier_id
  end
end
