class Batch < ActiveRecord::Base
  include Searchable
  belongs_to :recipe
  belongs_to :fermenter
  belongs_to :user
  attr_accessible :date, :finish_gravity, :original_gravity, :target_date, :yield
  attr_accessible :recipe_id, :fermenter_id, :user_id

  attr_accessor :volume_unit, :og_density_unit, :fg_density_unit # Virtual field for units in forms
  attr_accessible :volume_unit, :og_density_unit, :fg_density_unit # Virtual field for units in forms

#  validates :recipe, :presence => true
#  validates :fermenter, :presence => true
#  validates :yield, :presence => true, :numericality => true
#  validates :finish_gravity, :presence => true, :numericality => true
#  validates :original_gravity, :presence => true, :numericality => true
#  validates :date, :presence => true, :timeliness => { :type => :date}

  self.per_page = 10

  def self.search_query(search)
    joins(:recipe).where('recipes.name LIKE ?', "%#{search}%")
  end

  def start_time
    target_date
  end

end
