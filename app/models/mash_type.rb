class MashType < ActiveRecord::Base
  has_many :recipes, :through => :recipe_mashes
  has_many :recipe_mashes
  attr_accessible :name
end
