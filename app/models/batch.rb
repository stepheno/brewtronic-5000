class Batch < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :fermenter
  belongs_to :brewer
  attr_accessible :date, :finish_gravity, :original_gravity, :target_date, :yield
end
