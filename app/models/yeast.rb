class Yeast < ActiveRecord::Base
  attr_accessible :efficiency, :manufacturer_id, :name, :yeast_type
  belongs_to :yeast_manufacturer
end
