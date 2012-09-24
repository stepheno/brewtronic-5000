class HopSupplier < ActiveRecord::Base
  attr_accessible :name
  has_many :hops
  has_many :hop_inventories:
end
