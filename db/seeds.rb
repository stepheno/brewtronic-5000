# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'rexml/document'

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

# Insert for Yeasts
yeast_manufacturers = ['Wyeast','White Labs']
yeast_manufacturers.each { |yeast_manufacturer| YeastManufacturer.create(:name => yeast_manufacturer) }

# Insert for Styles
xml = File.read('db/seeds/styleguide2008.xml')
doc = REXML::Document.new(xml)
doc.elements.each('styleguide/class/category') do |cat|
  cat_id = cat.attributes["id"].to_i
  cat.elements.each('subcategory') do |subcat|
    name =  subcat.elements["name"].text
    subcat_id = subcat.attributes["id"].to_i
    begin
    og_low = Units.convert_density_units(subcat.elements["stats/og/low"].text.to_f, "sg")
    og_high = Units.convert_density_units(subcat.elements["stats/og/high"].text.to_f, "sg")
    fg_low = Units.convert_density_units(subcat.elements["stats/fg/low"].text.to_f, "sg")
    fg_high = Units.convert_density_units(subcat.elements["stats/fg/high"].text.to_f, "sg")
    ibu_low = subcat.elements["stats/ibu/low"].text.to_f
    ibu_high = subcat.elements["stats/ibu/high"].text.to_f
    srm_low = subcat.elements["stats/srm/low"].text.to_f
    srm_high = subcat.elements["stats/srm/high"].text.to_f
    rescue
      og_low,og_high,fg_low,fg_high,ibu_low,ibu_high,srm_low,srm_high,= 0
    end
     Style.create(:name => name,
               :category => cat_id,
               :sub_category => subcat_id,
               :og_range_low => og_low,
               :og_range_high => og_high,
               :fg_range_low => fg_low,
               :fg_range_high => fg_high,
               :ibu_range_low => ibu_low,
               :ibu_range_high => ibu_high,
               :srm_range_low => srm_low,
               :srm_range_high => srm_high)
  end
end

