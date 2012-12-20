class Brewer < ActiveRecord::Base
  attr_accessible :name

  has_many :batches
  self.per_page = 10
end
