class RecipeGrain < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :grain
  attr_accessible :amount, :grain_id, :recipe_id

  self.per_page = 10
end
