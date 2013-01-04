class GrainSupplier < ActiveRecord::Base
  include Searchable
  attr_accessible :name, :grain_tokens
  attr_reader :grain_tokens
  has_many :grain_inventories
  has_many :grain_transactions
  has_and_belongs_to_many :grains
  validates_uniqueness_of :name

  self.per_page = 10

  def grain_tokens=(ids)
    self.grain_ids = ids.split(",")
  end

end
