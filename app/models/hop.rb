class Hop < ActiveRecord::Base
  attr_accessible :alpha, :name, :beta, :hop_supplier_id
  belongs_to :hop_supplier
  has_many :hop_inventories

  validates :name, :presence => true
  validates :alpha, :presence => true, :numericality => true
  validates :beta, :numericality => true, :allow_blank => true
  validates :hop_supplier_id, :presence => true
end
