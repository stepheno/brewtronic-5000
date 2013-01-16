class RecipeHop < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :hop
  attr_accessible :amount, :location, :time, :recipe_id, :hop_id

  validates :time, :presence => true, :numericality => true
  self.per_page = 10

  def specific_gravity
    specific_gravity = 1 + self.recipe.target_og/(258.6-((self.recipe.target_og/258.2)*227.1))
  end

  def calculated_ibu
    utilization_factor = 1.65 * (0.000125**(self.specific_gravity - 1))
    boil_factor = (1 - Math::E**(-0.04 * self.time)) / 4.15
    alpha_acid_concentration = ((self.hop.alpha / 100) * self.amount.kg.to_g.value * 1000) / self.recipe.size
    calc_ibu = (utilization_factor * boil_factor) * alpha_acid_concentration
  end

end
