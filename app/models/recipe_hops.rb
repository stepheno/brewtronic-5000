class RecipeHops < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :hop
  attr_accessible :amount, :location, :time
end
