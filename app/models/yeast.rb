class Yeast < ActiveRecord::Base
  attr_accessible :efficiency, :yeast_manufacturer_id, :name, :yeast_type
  belongs_to :yeast_manufacturer
  validates :name, :uniqueness => {:scope => :yeast_manufacturer_id}
  validates :yeast_manufacturer_id, :presence => true
  self.per_page = 10
end
