class AddTemperatureRangeToYeasts < ActiveRecord::Migration
  def change
    add_column :yeasts, :temp_low, :float
    add_column :yeasts, :temp_high, :float
    rename_column :yeasts, :efficiency, :attenuation_low
    add_column :yeasts, :attenuation_high, :float
  end
end
