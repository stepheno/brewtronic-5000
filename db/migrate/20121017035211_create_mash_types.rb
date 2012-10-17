class CreateMashTypes < ActiveRecord::Migration
  def change
    create_table :mash_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
