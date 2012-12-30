class Mineral < ActiveRecord::Base
  include Searchable
  has_many :recipe_minerals
  has_many :recipes, :through => :recipe_minerals
  attr_accessible :calcium, :carbonate, :chloride, :magnesium, :name, :sodium, :sulfate
  validates :name, :presence => true, :uniqueness => true
  validates :calcium, :numericality => true
  validates :carbonate, :numericality => true
  validates :chloride, :numericality => true
  validates :magnesium, :numericality => true
  validates :sodium, :numericality => true
  validates :sulfate, :numericality => true

  self.per_page = 10
end
