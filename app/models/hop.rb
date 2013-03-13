class Hop < ActiveRecord::Base
  include Searchable
  attr_accessible :alpha, :name, :beta, :hsi, :hop_supplier_id, :year
  has_many :hop_inventories, :dependent => :destroy
  has_many :hop_transactions, :dependent => :destroy
  has_many :hop_contracts, :dependent => :destroy
  has_many :recipes, :through => :recipe_hops
  has_many :recipe_hops
  belongs_to :hop_supplier

  validates :name, :presence => true
  validates :alpha, :presence => true, :numericality => true
  validates :beta, :numericality => true, :allow_blank => true
  validates :hsi, :presence => true, :numericality => true
  validates_uniqueness_of :name, :scope => [:hop_supplier_id, :year]

  self.per_page = 10

end
