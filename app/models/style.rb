class Style < ActiveRecord::Base
  attr_accessible :category, :fg_range_high, :fg_range_low, :ibu_range_high, :ibu_range_low, :name, :og_range_high, :og_range_low, :srm_range_high, :srm_range_low, :sub_category
  validates :name, :presence => true
  validates :category, :presence => true, :numericality => true
  validates :sub_category, :presence => true, :numericality => true 
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
