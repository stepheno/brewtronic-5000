class AddUnitPrefsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :volume_units, :string, default: "l"
    add_column :users, :mass_units, :string, default: "kg"
    add_column :users, :length_units, :string, default: "m"
    add_column :users, :time_zone, :string

  end
end
