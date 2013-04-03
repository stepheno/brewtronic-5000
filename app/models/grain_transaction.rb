class GrainTransaction < ActiveRecord::Base
  include Searchable
  belongs_to :grain
  belongs_to :grain_supplier
  belongs_to :grain_inventory
  attr_accessible :quantity, :amount, :grain_id, :grain_supplier_id, :grain_inventory_id
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

  def modify_inventory
    if self.grain_inventory.nil?
      self.grain_inventory = GrainInventory.create(:grain_id => self.grain_id, :grain_supplier_id => self.grain_supplier_id, :amount => self.total_amount)
    else
      self.grain_inventory.amount = grain_inventory.amount + self.total_amount
    end
    self.grain_inventory.save!
    self.save!
  end

  def total_amount
    self.amount * self.quantity
  end

end
