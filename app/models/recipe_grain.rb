class RecipeGrain < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :grain
  attr_accessible :amount, :grain_id, :recipe_id

  attr_accessor :grain_virt_attr, :unit # Virtual fields for grain in forms
  attr_accessible :grain_virt_attr, :unit # Virtual fields for grain in forms


  self.per_page = 10

  def calculated_og
    specific_gravity = (self.amount.kg.to_lb.value * ((self.grain.extract_potential - 1) * 1000) * 0.8) / self.recipe.size.L.to_gal.value
    sg = (specific_gravity / 1000) + 1
    plato = Units.sg_to_plato(sg)
  end
end
