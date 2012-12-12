class RecipeMinerals < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :mineral
  attr_accessible :amount

  self.per_page = 10
end
