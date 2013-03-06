class Fermenter < ActiveRecord::Base
  include Searchable
  attr_accessible :fermenter_type, :name, :size
  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms

  has_many :batches
  validates :name, :presence => true, :uniqueness => true
  validates :size, :numericality => true
 
  self.per_page = 10
end
