# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: 'admin@me.com', password: 'admin123', admin: true})

NavbarEntry.create({title:"Tasks", url: '/tasks'})
NavbarEntry.create({title:"Locations", url: '/locations'})
NavbarEntry.create({title:"Users", url: '/profiles'})

c=Category.create({name: 'Urgent'})
c=Category.create({name: 'Procrastinate'})
t=Task.create({title: "Wash clothes"})

t.categories << c
t.save
