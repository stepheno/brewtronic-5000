class AddDensityPreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :density_units, :string, default: "plato"
  end
end
