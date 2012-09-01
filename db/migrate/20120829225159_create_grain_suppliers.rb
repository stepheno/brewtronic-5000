class CreateGrainSuppliers < ActiveRecord::Migration
  def change
    create_table :grain_suppliers do |t|
      t.string :name

      t.timestamps
    end
  end
end
