class Recipe < ActiveRecord::Base
  has_many :recipe_grains
  has_many :grains, :through => :recipe_grains
  has_many :recipe_hops
  has_many :hops, :through => :recipe_hops
  has_many :recipe_minerals
  has_many :minerals, :through => :recipe_minerals
  has_many :recipe_mashes
  has_many :mash_types, :through => :recipe_mashes
  attr_accessible :abv, :boil_time, :ibu, :name, :pitch_temperature, :size, :srm, :style, :target_fg, :target_og, :yeast
end
