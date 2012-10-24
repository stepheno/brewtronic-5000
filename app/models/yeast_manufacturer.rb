class YeastManufacturer < ActiveRecord::Base
  attr_accessible :name
  has_many :yeasts
end
