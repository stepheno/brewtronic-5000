class CreateGrainSuppliers < ActiveRecord::Migration
  def change
    create_table :grain_suppliers do |t|
      t.text :name

      t.timestamps
    end
  end
end
