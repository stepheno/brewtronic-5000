class Grain < ActiveRecord::Base
  include Searchable
  attr_accessible :color, :extract_potential, :name, :grain_supplier_id
  attr_accessor :display_name
  has_many :grain_inventories, :dependent => :destroy
  has_many :grain_transactions, :dependent => :destroy
  has_many :recipes, :through => :recipe_grains
  has_many :recipe_grains
  belongs_to :grain_supplier

  validates :extract_potential, :numericality => true
  validates :color, :numericality => true
  validates :grain_supplier, :presence => true
  validates_uniqueness_of :name, :scope => :grain_supplier_id

  self.per_page = 10

  def display_name 
    supplier_name = self.grain_supplier.name unless self.grain_supplier.nil?
    return "#{self.name} (#{supplier_name})"
  end
end
