class Batch < ActiveRecord::Base
  include Searchable
  belongs_to :recipe
  belongs_to :fermenter
  belongs_to :brewer
  attr_accessible :date, :finish_gravity, :original_gravity, :target_date, :yield
  attr_accessible :recipe_id, :fermenter_id, :brewer_id

  attr_accessor :unit # Virtual field for units in forms
  attr_accessible :unit # Virtual field for units in forms


  self.per_page = 10

  def self.search_query(search)
    joins(:recipe).where('recipes.name LIKE ?', "%#{search}%")
  end

end
