class CreateYeastManufacturers < ActiveRecord::Migration
  def change
    create_table :yeast_manufacturers do |t|
      t.string :name

      t.timestamps
    end
  end
end
