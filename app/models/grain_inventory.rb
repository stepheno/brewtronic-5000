class GrainInventory < ActiveRecord::Base
  attr_accessible :amount, :grain_id
  belongs_to :grain
  belongs_to :grain_supplier
  validates :amount, :numericality => true
end
