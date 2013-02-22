class RecipeMash < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :mash_type
  attr_accessible :temperature, :time, :recipe_id, :mash_type_id

  attr_accessor :mash_virt_attr, :unit # Virtual fields for mash in forms
  attr_accessible :mash_virt_attr, :unit # Virtual fields for mash in forms

  self.per_page = 10
end
