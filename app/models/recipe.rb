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
  attr_accessible :abv, :boil_time, :ibu, :name, :pitch_temperature, :size,
                  :srm, :target_fg, :target_og, :creation_date
  attr_accessible :yeast_id, :style_id
  attr_accessible :recipe_minerals_attributes, :recipe_grains_attributes, :recipe_hops_attributes, :recipe_mashes_attributes

  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms

  validates :name, :presence => true
  validates :yeast, :presence => true
  validates :style, :presence => true
  validates :pitch_temperature, :presence => true, :numericality => true
  validates :ibu, :numericality => true
  validates :size, :presence => true, :numericality => true
  validates :srm, :numericality => true
  validates :target_og, :presence => true, :numericality => true
  validates :target_fg, :presence => true, :numericality => true
  validates :creation_date, :presence => true

  self.per_page = 10

  def calculated_ibu
    self.recipe_hops.reduce(0) { |sum,x| sum + x.calculated_ibu}
  end

  def calculated_og
    self.recipe_grains.reduce(0) { |sum,x| sum + x.calculated_og}
  end

  # George Fix method
  def calculated_abv
    real_extract = (0.1808 * Units.plato_to_sg(self.target_og)) + (0.8192 * Units.plato_to_sg(self.target_fg))
    abv = ((self.target_og - real_extract) / (2.0665 - (0.010665 * self.target_og))) * 0.789
  end
end
