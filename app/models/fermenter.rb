class Fermenter < ActiveRecord::Base
  attr_accessible :fermenter_type, :name, :size
  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms

  validates :name, :uniqueness => true
  validates :size, :numericality => true
 
  self.per_page = 10
end
