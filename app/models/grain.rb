class Grain < ActiveRecord::Base
  attr_accessible :color, :extract_potential, :name
  has_many :grain_inventories
  validates :extract_potential, :numericality => true
  validates :color, :numericality => true
end
