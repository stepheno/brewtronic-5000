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

  def modify_inventory
    grain_inventory = GrainInventory.where(:grain_id => self.grain_id).where(:grain_supplier_id => self.grain_supplier_id).first
    total_amount = self.quantity * self.amount

    if (grain_inventory.nil?)
      grain_inventory = GrainInventory.create(:grain_id => self.grain_id, :grain_supplier_id => self.grain_supplier_id, :amount => total_amount)
    else
      grain_inventory.amount = grain_inventory.amount + total_amount
    end
    grain_inventory.save
  end

end
