class GrainTransaction < ActiveRecord::Base
  belongs_to :grain
  belongs_to :grain_supplier
  attr_accessible :quantity, :unit_amount, :grain_id, :grain_supplier_id
  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms

  validates :quantity, :presence => true, :numericality => true
  validates :unit_amount, :presence => true, :numericality => true
end
