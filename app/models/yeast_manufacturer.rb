class YeastManufacturer < ActiveRecord::Base
  include Searchable
  attr_accessible :name
  has_many :yeasts, :dependent => :destroy
  validates_uniqueness_of :name

  self.per_page = 10
end
