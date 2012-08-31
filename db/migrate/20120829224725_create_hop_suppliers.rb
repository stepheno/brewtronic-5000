class CreateHopSuppliers < ActiveRecord::Migration
  def change
    create_table :hop_suppliers do |t|
      t.text :name

      t.timestamps
    end
  end
end
