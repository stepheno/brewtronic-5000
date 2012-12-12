class Mineral < ActiveRecord::Base
  has_many :recipe_minerals
  has_many :recipes, :through => :recipe_minerals
  attr_accessible :calcium, :carbonate, :chloride, :magnesium, :name, :sodium, :sulfate

  self.per_page = 10
end
