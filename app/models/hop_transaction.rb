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
  belongs_to :hop_contract
  belongs_to :hop_inventory
  attr_accessible :quantity, :amount, :hop_year, :hop_type, :hop_id, :hop_supplier_id, :hop_inventory_id
  attr_accessible :hop_contract_id

  attr_accessor :unit #Virtual field for units in forms
  attr_accessible :unit #Virtual field for units in forms

  validates :hop, :presence => true
  validates :hop_supplier, :presence => true
  validates :quantity, :presence => true, :numericality => true
  validates :amount, :presence => true, :numericality => true
  validates :hop_year, :presence => true

  self.per_page = 10

  def self.search_query(search)
    joins(:hop).where('hops.name LIKE ?', "%#{search}%")
  end

  def modify_inventory
    hop_inventory = HopInventory.where(:hop_id => self.hop_id)
                                     .where(:hop_supplier_id => self.hop_supplier_id)
                                     .where(:hop_type => self.hop_type)
                                     .first

   total_amount = self.quantity * self.amount

    if self.hop_inventory.nil?
      self.hop_inventory = HopInventory.create(:hop_id => self.hop_id,
          :hop_supplier_id => self.hop_supplier_id,
          :amount => self.total_amount,
          :hop_type => self.hop_type,
          :crop_year => self.hop_year)
    else
      self.hop_inventory.amount = hop_inventory.amount + self.total_amount
    end
    self.hop_inventory.save!
    self.save!
  end

  def total_amount
    self.amount * self.quantity
  end

end
