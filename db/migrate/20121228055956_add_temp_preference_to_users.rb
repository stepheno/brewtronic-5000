class AddTempPreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temp_units, :string, default: "C"
  end
end
