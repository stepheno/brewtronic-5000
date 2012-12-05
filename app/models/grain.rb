class Grain < ActiveRecord::Base
  attr_accessible :color, :extract_potential, :name
  has_many :grain_inventories, :dependent => :destroy
  has_many :recipes, :through => :recipe_grains, :dependent => :destroy
  has_many :recipe_grains, :dependent => :destroy
  validates :extract_potential, :numericality => true
  validates :color, :numericality => true
  validates_uniqueness_of :name
end
