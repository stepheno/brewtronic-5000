class GrainInventory < ActiveRecord::Base
  attr_accessible :amount
  belongs_to :grain
  belongs_to :grain_supplier
end
