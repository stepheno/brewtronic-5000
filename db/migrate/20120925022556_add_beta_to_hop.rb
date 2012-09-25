class AddBetaToHop < ActiveRecord::Migration
  def change
    add_column :hops, :beta, :float
  end
end
