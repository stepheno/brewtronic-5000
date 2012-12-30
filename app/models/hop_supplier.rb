class HopSupplier < ActiveRecord::Base
  include Searchable
  attr_accessible :name
  has_many :hops, :dependent => :destroy
  has_many :hop_inventories, :dependent => :destroy
  has_many :hop_transactions, :dependent => :destroy
  validates_uniqueness_of :name

  self.per_page = 10
end
