# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
Cat.create(birth_date: Date.new(2018, 1, 6) , name: 'Felix',    sex: 'M' , color: 'orange', description: 'These are just the regular cats')
Cat.create(birth_date: Date.new(2019, 4, 8) , name: 'Samantha', sex: 'F' , color: 'gray',   description: 'These are just the regular cats')
Cat.create(birth_date: Date.new(2013, 2, 20) , name: 'Oscar' ,   sex: 'M' , color: 'gray',   description: 'These are just the regular cats')
Cat.create(birth_date: Date.new(2015, 9, 13) , name: 'Greg',     sex: 'M' , color: 'brown',  description: 'This one is the owner\'s favorite')
Cat.create(birth_date: Date.new(2016, 12, 25) , name: 'Cleo',     sex: 'F' , color: 'white',  description: 'This is a special cat')
Cat.create(birth_date: Date.new(2015, 7, 4) , name: 'Gatsby',   sex: 'M' , color: 'orange', description: 'This is also a special cat')

