class HopInventory < ActiveRecord::Base
  include Searchable

  def is_valid_year?(date_str, start_year=1900, end_year=2099)
    date_str.grep(/^(\d)+$/) { |date_str|
      (start_year..end_year).include?(date_str.to_i)
    }.first
  end

  attr_accessor :unit #Virtual field for units in forms
  attr_accessible :unit #Virtual field for units in forms

  belongs_to :hop
  belongs_to :hop_supplier
  has_many :hop_transactions
  attr_accessible :amount, :crop_year, :hop_type, :hop_id, :hop_supplier_id
  attr_accessible :storage_temp, :storage_factor, :harvest_date
  validates :hop_id, :uniqueness => {:scope => [:crop_year, :hop_supplier_id]}
  validates :hop_type, :presence => true

  self.per_page = 10

  def self.search_query(search)
    joins(:hop).where('hops.name LIKE ?', "%#{search}%")
  end

  def current_alpha
    factors = self.hop.hsi * self.storage_temp * self.storage_factor
    date = Date.today - self.harvest_date
    self.hop.alpha * ( 1 / Math.log(factors * date))
  end

end
