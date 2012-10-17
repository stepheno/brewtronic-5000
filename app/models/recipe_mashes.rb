class RecipeMashes < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :mash_type
  attr_accessible :temperature, :time
end
