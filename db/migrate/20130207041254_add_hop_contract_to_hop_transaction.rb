class AddHopContractToHopTransaction < ActiveRecord::Migration
  def change
    add_column :hop_transactions, :hop_contract_id, :integer
  end
end
