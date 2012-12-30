class Grain < ActiveRecord::Base
  include Searchable
  attr_accessible :color, :extract_potential, :name
  has_many :grain_inventories, :dependent => :destroy
  has_many :grain_transactions, :dependent => :destroy
  has_many :recipes, :through => :recipe_grains
  has_many :recipe_grains
  validates :extract_potential, :numericality => true
  validates :color, :numericality => true
  validates_uniqueness_of :name

  self.per_page = 10
end
