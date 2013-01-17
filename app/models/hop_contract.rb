class HopContract < ActiveRecord::Base
  include Searchable
  belongs_to :hop_supplier
  belongs_to :hop
  attr_accessible :contract_amount, :used_amount, :hop_year, :hop_type
  attr_accessible :hop_id, :hop_supplier_id

  attr_accessor :unit #Virtual field for units in forms
  attr_accessible :unit #Virtual field for units in forms
 
  validates :hop_supplier, :presence => true
  validates :hop, :presence => true
  validates :hop_type, :presence => true
  validates :contract_amount, :presence => true, :numericality => true
  validates :used_amount, :presence => true, :numericality => true
  validates :hop_year, :presence => true
  
  self.per_page = 10

  def self.search_query(search)
    joins(:hop).where('hops.name LIKE ?', "%#{search}%")
  end

end
