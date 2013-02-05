class AddHsiToHops < ActiveRecord::Migration
  def change
    add_column :hops, :hsi, :float
  end
end
