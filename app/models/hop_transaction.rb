class HopTransaction < ActiveRecord::Base
  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :quantity, :unit_amount
  
  validates :quantity, :presence => true, :numericality => true
  validates :unit_amount, :presence => true, :numericality => true
end
