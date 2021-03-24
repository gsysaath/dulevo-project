puts "*** Destroy seeds ***"
RolesType.destroy_all
User.destroy_all
puts "*** Destroy seeds finished ***"
puts "*** Creating RolesTypes ***"
RolesType.create(id:1, code:'T', nameEN: 'Teacher')
RolesType.create(id:2, code:'D', nameEN: 'Dealer')
RolesType.create(id:3, code:'P', nameEN: 'Participant')
RolesType.create(id:4, code:'C', nameEN: 'Concessionary')
RolesType.create(id:5, code:'V', nameEN: 'Customer')
RolesType.create(id:6, code:'A', nameEN: 'Area Manager')
RolesType.create(id:7, code:'S', nameEN: 'Administrator (Super User)')
puts "*** Created RolesType ***"

puts "*** Creating Users ***"
puts "SuperUser / Admin"
georges = User.create( email: "georges.sysaath@gmail.com",
                    password: "qwerty",
                    first_name: 'Georges',
                    last_name: 'Sysaath',
                    roles_type_code: 'S',
                    nation: "FRANC",
                    language: "EN" )
puts "RandomUser"
puts "*** Created Users ***"
