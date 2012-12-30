class GrainTransaction < ActiveRecord::Base
  include Searchable
  belongs_to :grain
  belongs_to :grain_supplier
  attr_accessible :quantity, :amount, :grain_id, :grain_supplier_id
  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms

  validates :quantity, :presence => true, :numericality => true
  validates :amount, :presence => true, :numericality => true

  self.per_page = 10
end
