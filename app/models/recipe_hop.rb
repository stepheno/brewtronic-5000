class RecipeHop < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :hop
  attr_accessible :amount, :location, :time

  self.per_page = 10
end
