class RecipeMash < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :mash_type
  attr_accessible :temperature, :time, :recipe_id, :mash_type_id

  self.per_page = 10
end
