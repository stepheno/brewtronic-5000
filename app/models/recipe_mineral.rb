class RecipeMineral < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :mineral
  attr_accessible :amount, :mineral_id, :recipe_id

  self.per_page = 10
end
