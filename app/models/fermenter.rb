class Fermenter < ActiveRecord::Base
  attr_accessible :fermenter_type, :name, :size
 
  self.per_page = 10
end
