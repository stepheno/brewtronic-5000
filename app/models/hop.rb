class Hop < ActiveRecord::Base
  include Searchable
  attr_accessible :alpha, :name, :beta
  has_many :hop_inventories, :dependent => :destroy
  has_many :hop_transactions, :dependent => :destroy
  has_many :hop_contracts, :dependent => :destroy
  has_many :recipes, :through => :recipe_hops
  has_many :recipe_hops
  has_and_belongs_to_many :hop_suppliers

  validates :name, :presence => true
  validates :alpha, :presence => true, :numericality => true
  validates :beta, :numericality => true, :allow_blank => true
  validates_uniqueness_of :name

  self.per_page = 10

  def future_alpha
    self.alpha * (1 / Math::e) * (<HSI> * <tempFactor> * <storageFactor> * <days since last reading>)
  end

end
