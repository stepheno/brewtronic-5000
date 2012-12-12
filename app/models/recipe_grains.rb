class RecipeGrains < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :grain
  attr_accessible :amount, :grain, :recipe

  self.per_page = 10
end
