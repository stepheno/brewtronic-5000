class Yeast < ActiveRecord::Base
  attr_accessible :efficiency, :yeast_manufacturer_id, :name, :yeast_type
  belongs_to :yeast_manufacturer
  validates_uniqueness_of :name

  self.per_page = 10
end
