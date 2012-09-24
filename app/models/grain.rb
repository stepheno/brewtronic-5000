class Grain < ActiveRecord::Base
  attr_accessible :color, :extract_potential, :name
  has_many :grain_inventories
end
