class Hop < ActiveRecord::Base
  attr_accessible :alpha, :name, :beta, :hop_supplier_id
  belongs_to :hop_supplier
  has_many :hop_inventories, :dependent => :destroy
  has_many :hop_transactions, :dependent => :destroy
  has_many :recipes, :through => :recipe_hops
  has_many :recipe_hops

  validates :name, :presence => true
  validates :alpha, :presence => true, :numericality => true
  validates :beta, :numericality => true, :allow_blank => true
  validates :hop_supplier_id, :presence => true
  validates_uniqueness_of :name, :scope => [:hop_supplier_id]

  self.per_page = 10

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
