class GrainTransaction < ActiveRecord::Base
  belongs_to :grain
  belongs_to :grain_supplier
  attr_accessible :quantity, :unit_amount
end
