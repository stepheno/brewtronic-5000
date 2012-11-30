# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# Insert grains
CSV.foreach("db/seeds/grains.csv") do |grain|
  newGrain = Grain.new(:name => grain[0], :color => grain[1].to_f, :extract_potential => grain[2].to_f)
  newGrain.save
end

# Insert hops 
CSV.foreach("db/seeds/hops.csv") do |hop|
  newHop = Hop.new(:name => hop[0], :alpha=> hop[1].to_f, :hop_supplier_id => 1)
  newHop.save
end
