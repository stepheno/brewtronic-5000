class GrainInventory < ActiveRecord::Base
  attr_accessible :amount
  has_one :grain
  has_one :grain_supplier
end
