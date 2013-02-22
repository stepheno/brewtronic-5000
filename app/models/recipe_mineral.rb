class RecipeMineral < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :mineral
  attr_accessible :amount, :mineral_id, :recipe_id

  attr_accessor :mineral_virt_attr, :unit # Virtual fields for mineral in forms
  attr_accessible :mineral_virt_attr, :unit # Virtual fields for mineral in forms

  self.per_page = 10
end
