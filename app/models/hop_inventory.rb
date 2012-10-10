class HopInventory < ActiveRecord::Base

  def is_valid_year?(date_str, start_year=1900, end_year=2099)
    date_str.grep(/^(\d)+$/) { |date_str|
      (start_year..end_year).include?(date_str.to_i)
    }.first
  end


  belongs_to :hop
  belongs_to :hop_supplier
  attr_accessible :amount, :crop_year, :hop_type, :hop_id, :hop_supplier_id
end
