# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

conferences = [
  {
    name: "Awesome Conf",
    start_date: "2013-11-22",
    end_date: "2013-11-22",
    location: "Tampa, FL"
  },
  {
    name: "Bitch, I'm Fabulous Conf",
    start_date: "2013-11-29",
    end_date: "2013-11-29",
    location: "Chicago, IL"
  },
  {
    name: "Software Craftsmanship North America",
    start_date: "2013-12-08",
    end_date: "2013-12-08",
    location: "Chicago, IL"
  },
]

conferences.each do |conference_attributes|
  conference = Conference.find_or_create_by(name: conference_attributes[:name])
  conference.update_attributes(conference_attributes)
end
