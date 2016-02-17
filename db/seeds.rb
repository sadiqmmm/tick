# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless State.exists?
	State.create(name: "New", color: "#0066CC")
	State.create(name: "Open", color: "#008000")
	State.create(name: "Closed", color: "#990000")
	State.create(name: "Awesome", color: "#663399")
end



