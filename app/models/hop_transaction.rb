class HopTransaction < ActiveRecord::Base
  include Units
  include Searchable

  def is_valid_year?(date_str, start_year=1900, end_year=2099)
    date_str.grep(/^(\d)+$/) { |date_str|
      (start_year..end_year).include?(date_str.to_i)
    }.first
  end

  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :quantity, :amount, :hop_year, :hop_type, :hop_id, :hop_supplier_id

  attr_accessor :unit #Virtual field for units in forms
  attr_accessible :unit #Virtual field for units in forms
 
  validates :quantity, :presence => true, :numericality => true
  validates :amount, :presence => true, :numericality => true

  self.per_page = 10

  def self.search_query(search)
    joins(:hop).where('hops.name LIKE ?', "%#{search}%")
  end

end
