class AddHopTypeToHopTransaction < ActiveRecord::Migration
  def change
    add_column :hop_transactions, :hop_type, :string
  end
end
