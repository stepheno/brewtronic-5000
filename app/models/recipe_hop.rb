class RecipeHop < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :hop
  attr_accessible :amount, :location, :time, :recipe_id, :hop_id

  self.per_page = 10
end
