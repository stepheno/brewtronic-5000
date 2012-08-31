class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.text :name
      t.float :alpha

      t.timestamps
    end
  end
end
