class HopInventory < ActiveRecord::Base
  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :amount, :crop_year, :hop_type, :hop_id, :hop_supplier_id
end
