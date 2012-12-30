class Yeast < ActiveRecord::Base
  include Searchable
  attr_accessible :attenuation_low, :attenuation_high, :yeast_manufacturer_id, :name, :yeast_type, :temp_low, :temp_high
  belongs_to :yeast_manufacturer
  validates :name, :uniqueness => {:scope => :yeast_manufacturer_id}
  validates :yeast_manufacturer_id, :presence => true
  self.per_page = 10
end
