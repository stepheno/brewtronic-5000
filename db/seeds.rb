# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

grain_suppliers = ['Great Western','Breiss','Rahr','Weyermann','Simpsons']
grain_suppliers.each { |grain_supplier| GrainSupplier.create(:name => grain_supplier) }

# Insert grains
CSV.foreach("db/seeds/grains.csv") do |grain|
  newGrain = Grain.new(:name => grain[0], :color => grain[1].to_f, :extract_potential => grain[2].to_f)
  newGrain.save
end

hop_suppliers = ['Hop Union','BSG']
hop_suppliers.each { |hop_supplier| HopSupplier.create(:name => hop_supplier) }

# Insert hops 
CSV.foreach("db/seeds/hops.csv") do |hop|
  newHop = Hop.new(:name => hop[0], :alpha=> hop[1].to_f, :hop_supplier_id => HopSupplier.first.id)
  newHop.save
end
