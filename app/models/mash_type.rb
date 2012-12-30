class MashType < ActiveRecord::Base
  include Searchable
  has_many :recipes, :through => :recipe_mashes
  has_many :recipe_mashes
  attr_accessible :name

  self.per_page = 10
end
