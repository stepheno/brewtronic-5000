class HopSupplier < ActiveRecord::Base
  attr_accessible :name
  has_many :hops
end
