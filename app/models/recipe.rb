class Recipe < ActiveRecord::Base
  has_many :recipe_grain
  accepts_nested_attributes_for :recipe_grain
  has_many :grains, :through => :recipe_grain
  has_many :recipe_hop
  accepts_nested_attributes_for :recipe_hop
  has_many :hops, :through => :recipe_hop
  has_many :recipe_mineral
  accepts_nested_attributes_for :recipe_mineral
  has_many :minerals, :through => :recipe_mineral
  has_many :recipe_mash
  accepts_nested_attributes_for :recipe_mash
  has_many :mash_types, :through => :recipe_mash
  belongs_to :yeast
  belongs_to :style
  has_many :batches
  attr_accessible :abv, :boil_time, :ibu, :name, :pitch_temperature, :size, :srm, :target_fg, :target_og
  attr_accessible :yeast_id, :style_id

  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms


  self.per_page = 10
end
