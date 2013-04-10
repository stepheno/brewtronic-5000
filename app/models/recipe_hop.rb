class RecipeHop < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :hop
  attr_accessible :amount, :hop_type, :location, :time, :recipe_id, :hop_id

  validates :time, :presence => true, :numericality => true
  self.per_page = 10

  attr_accessor :hop_virt_attr, :unit # Virtual fields for hop in forms
  attr_accessible :hop_virt_attr, :unit # Virtual fields for hop in forms

  def tinseth_ibu
    utilization_factor = 1.65 * (0.000125**(Units.plato_to_sg(self.recipe.target_og) - 1))
    boil_factor = (1 - Math::E**(-0.04 * self.time)) / 4.15
    alpha_acid_concentration = ((self.hop.alpha / 100) * self.amount.kg.to_g.value * 1000) / self.recipe.size
    calc_ibu = (utilization_factor * boil_factor) * alpha_acid_concentration
  end

  def rager_ibu
    utilization = 18.11 + 13.86 * Math.tanh((self.time - 31.32) / 18.27)
    gravity_adjustment = self.recipe.target_og > 12.5 ? (Units.plato_to_sg(self.recipe.target_og) - 1.050) / 0.2 : 0
    calc_ibu = (self.amount.kg.to_g.value * utilization * self.hop.alpha * 0.1) / (self.recipe.size * (1 + gravity_adjustment))
  end

  def calculated_ibu(user)
    unless user.nil?
      case user.hop_formula
        when "tinseth"
          self.tinseth_ibu
        when "rager"
          self.rager_ibu
        else
          raise "IBU calculation method not supported"
      end
    else
      self.tinseth_ibu
    end
  end

  def hop_virt_attr
    self.hop.name unless self.hop.nil?
  end
end
