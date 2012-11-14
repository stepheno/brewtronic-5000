class HopTransaction < ActiveRecord::Base
  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :quantity, :unit_amount, :hop_id, :hop_supplier_id

  attr_accessor :unit #Virtual field for units in forms
  attr_accessible :unit #Virtual field for units in forms
 
  validates :quantity, :presence => true, :numericality => true
  validates :unit_amount, :presence => true, :numericality => true
end
