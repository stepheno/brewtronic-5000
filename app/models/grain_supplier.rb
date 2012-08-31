class GrainSupplier < ActiveRecord::Base
  attr_accessible :name
  has_many :grain
end
