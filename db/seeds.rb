# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_u = User.create({email: 'admin@me.com', password: 'admin123', admin: true})
u2 = User.create({email: 'just_u@me.com', password: 'userme123', admin: false})

NavbarEntry.create({title:"Tasks", url: '/tasks'})
NavbarEntry.create({title:"Locations", url: '/locations'})
NavbarEntry.create({title:"Users", url: '/profiles'})

urg_c=Category.create({name: 'Urgent'})
proc_c=Category.create({name: 'Procrastinate'})


t=Task.create({title: "Wash clothes", due_date: Date.today + 1}})
t.owner = admin_u

t.categories << urg_c
t.save

t=Task.create({title: "Call mom"})
t.owner = u2
t.categories << proc_c
t.save
