class CreateFermenters < ActiveRecord::Migration
  def change
    create_table :fermenters do |t|
      t.float :size
      t.string :name
      t.string :fermenter_type

      t.timestamps
    end
  end
end
