class Style < ActiveRecord::Base
  include Searchable
  attr_accessible :category, :fg_range_high, :fg_range_low, :ibu_range_high, :ibu_range_low, :name, :og_range_high, :og_range_low, :srm_range_high, :srm_range_low, :sub_category

  # Virtual fields for units
  attr_accessor :og_low_density_unit, :og_high_density_unit
  attr_accessor :fg_low_density_unit, :fg_high_density_unit
  attr_accessor :og_low_density_unit, :og_high_density_unit
  attr_accessor :fg_low_density_unit, :fg_high_density_unit
  attr_accessible :og_low_density_unit, :og_high_density_unit
  attr_accessible :fg_low_density_unit, :fg_high_density_unit
  attr_accessible :og_low_density_unit, :og_high_density_unit
  attr_accessible :fg_low_density_unit, :fg_high_density_unit

  validates :name, :presence => true, :uniqueness => true
  validates :category, :presence => true, :numericality => true
  validates :sub_category, :presence => true 
  validates :og_range_high, :presence => true, :numericality => true
  validates :og_range_low, :presence => true, :numericality => true
  validates :fg_range_high, :presence => true, :numericality => true
  validates :fg_range_low, :presence => true, :numericality => true
  validates :ibu_range_high, :presence => true, :numericality => true
  validates :ibu_range_low, :presence => true, :numericality => true
  validates :srm_range_high, :presence => true, :numericality => true
  validates :srm_range_low, :presence => true, :numericality => true

  self.per_page = 10
end
