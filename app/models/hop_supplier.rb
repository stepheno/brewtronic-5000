class HopSupplier < ActiveRecord::Base
  include Searchable
  attr_accessible :name, :hop_tokens
  attr_reader :hop_tokens
  has_and_belongs_to_many :hops
  has_many :hop_inventories, :dependent => :destroy
  has_many :hop_transactions, :dependent => :destroy
  has_many :hop_contracts, :dependent => :destroy
  validates_uniqueness_of :name

  self.per_page = 10

  def hop_tokens=(ids)
    self.hop_ids = ids.split(",")
  end

end
