class RecipeGrain < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :grain
  attr_accessible :amount, :grain_id, :recipe_id

  self.per_page = 10

  def calculated_og
    specific_gravity = (self.amount.kg.to_lb.value * ((self.grain.extract_potential - 1) * 1000) * 0.8) / self.recipe.size.L.to_gal.value
    sg = (specific_gravity / 1000) + 1
    plato = -676.67 + (1286.4 * sg) - (800.47 * sg**2) + (190.74 * sg**3)
  end
end
