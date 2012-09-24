class Hop < ActiveRecord::Base
  attr_accessible :alpha, :name
  belongs_to :hop_supplier
  has_many :hop_inventories

  validates :name, :presence => true
  validates :alpha, :presence => true
end
