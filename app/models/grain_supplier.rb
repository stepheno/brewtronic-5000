class GrainSupplier < ActiveRecord::Base
  attr_accessible :name
  has_many :grain_inventories
end
