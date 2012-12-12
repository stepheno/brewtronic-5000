class GrainSupplier < ActiveRecord::Base
  attr_accessible :name
  has_many :grain_inventories
  validates_uniqueness_of :name

  self.per_page = 10
end
