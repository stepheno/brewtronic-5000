class Recipe < ActiveRecord::Base
  include Searchable
  has_many :recipe_grains
  accepts_nested_attributes_for :recipe_grains
  has_many :grains, :through => :recipe_grains
  has_many :recipe_hops
  accepts_nested_attributes_for :recipe_hops
  has_many :hops, :through => :recipe_hops
  has_many :recipe_minerals
  accepts_nested_attributes_for :recipe_minerals
  has_many :minerals, :through => :recipe_minerals
  has_many :recipe_mashes
  accepts_nested_attributes_for :recipe_mashes
  has_many :mash_types, :through => :recipe_mashes
  belongs_to :yeast
  belongs_to :style
  has_many :batches
  attr_accessible :abv, :boil_time, :ibu, :name, :pitch_temperature, :size, :srm, :target_fg, :target_og
  attr_accessible :yeast_id, :style_id
  attr_accessible :recipe_minerals_attributes, :recipe_grains_attributes, :recipe_hops_attributes, :recipe_mashes_attributes

  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms


  self.per_page = 10
end
