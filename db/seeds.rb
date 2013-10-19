# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# populate regions
regions = {}
CSV.parse(File.read(File.expand_path("../csv/regions.csv", __FILE__)), :headers => true).each do |row|
  h = row.to_hash
  Region.create!(:name => h["name"], :code => h["code"], :continent => h["continent"], :iso_country => h["iso_country"])
  regions[h["code"]] = h["name"]
end


# populate airports
csv = CSV.parse(File.read(File.expand_path("../csv/airports.csv", __FILE__)), :headers => true)
count = 0
csv.each do |row|
  r = row.to_hash
  Airport.create!(:name => r["name"], :airport_type => r["type"], :code => r["local_code"], :location => "#{r["municipality"]} #{regions[r["iso_region"]]} #{r["iso_country"]}", :latitude => r["latitude_deg"], :longitude => r["longitude_deg"])
  count += 1
  puts "#{count} / 45378" if count % 1000 == 0
end
