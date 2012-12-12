class GrainInventory < ActiveRecord::Base
  attr_accessible :amount, :grain_id, :grain_supplier_id
  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms
  belongs_to :grain
  belongs_to :grain_supplier
  validates :amount, :numericality => true
  validates :grain_id, :uniqueness => {:scope => :grain_supplier_id}

  self.per_page = 10
end
