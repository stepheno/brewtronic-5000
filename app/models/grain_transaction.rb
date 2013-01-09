class GrainTransaction < ActiveRecord::Base
  include Searchable
  belongs_to :grain
  belongs_to :grain_supplier
  attr_accessible :quantity, :amount, :grain_id, :grain_supplier_id
  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms

  validates :grain, :presence => true
  validates :grain_supplier, :presence => true
  validates :quantity, :presence => true, :numericality => true
  validates :amount, :presence => true, :numericality => true

  self.per_page = 10
  
  def self.search_query(search)
    joins(:grain).where('grains.name LIKE ?', "%#{search}%")
  end

end
