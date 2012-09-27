class HopInventory < ActiveRecord::Base
  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :amount, :crop_year, :type, :hop, :hop_supplier
end
