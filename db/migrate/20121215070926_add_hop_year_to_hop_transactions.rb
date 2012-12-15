class AddHopYearToHopTransactions < ActiveRecord::Migration
  def change
    add_column :hop_transactions, :hop_year, :integer
  end
end
