class HopInventory < ActiveRecord::Base

  def is_valid_year?(date_str, start_year=1900, end_year=2099)
    date_str.grep(/^(\d)+$/) { |date_str|
      (start_year..end_year).include?(date_str.to_i)
    }.first
  end

  attr_accessor :unit #Virtual field for units in forms
  attr_accessible :unit #Virtual field for units in forms

  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :amount, :crop_year, :hop_type, :hop_id, :hop_supplier_id
  validates :hop_id, :uniqueness => {:scope => [:crop_year, :hop_supplier_id]}

  self.per_page = 10
end
