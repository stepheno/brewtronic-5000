class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.references :recipe
      t.date :date
      t.references :fermenter
      t.references :brewer
      t.float :original_gravity
      t.float :finish_gravity
      t.float :yield
      t.date :target_date

      t.timestamps
    end
    add_index :batches, :recipe_id
    add_index :batches, :fermenter_id
    add_index :batches, :brewer_id
  end
end
