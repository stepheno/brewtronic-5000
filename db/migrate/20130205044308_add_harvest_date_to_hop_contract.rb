class AddHarvestDateToHopContract < ActiveRecord::Migration
  def change
    add_column :hop_contracts, :harvest_date, :date
    rename_column :hop_contracts, :hop_year, :contract_year
  end
end
