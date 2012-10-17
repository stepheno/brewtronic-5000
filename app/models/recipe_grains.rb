class RecipeGrains < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :grain
  attr_accessible :amount, :grain, :recipe
end
