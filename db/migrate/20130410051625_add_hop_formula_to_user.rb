class AddHopFormulaToUser < ActiveRecord::Migration
  def change
    add_column :users, :hop_formula, :string, :default => "tinseth"
  end
end
