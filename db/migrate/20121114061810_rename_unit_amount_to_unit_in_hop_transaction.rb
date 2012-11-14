class RenameUnitAmountToUnitInHopTransaction < ActiveRecord::Migration
  def change
    rename_column :hop_transactions, :unit_amount, :amount
  end
end
