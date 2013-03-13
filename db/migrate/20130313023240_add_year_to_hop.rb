class AddYearToHop < ActiveRecord::Migration
  def change
    add_column :hops, :year, :integer
    add_index :hops, :hop_supplier_id
  end
end
