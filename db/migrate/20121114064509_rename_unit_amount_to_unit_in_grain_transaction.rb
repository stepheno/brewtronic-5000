class RenameUnitAmountToUnitInGrainTransaction < ActiveRecord::Migration
  def change
    rename_column :grain_transactions, :unit_amount, :amount
  end
end
