class Grain < ActiveRecord::Base
  attr_accessible :color, :extract_potential, :name
  has_many :grain_inventories
  has_many :recipes, :through => :recipe_grains
  has_many :recipe_grains
  validates :extract_potential, :numericality => true
  validates :color, :numericality => true
end
