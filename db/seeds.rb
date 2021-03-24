puts "*** Destroy seeds ***"
Course.destroy_all
RolesType.destroy_all
User.destroy_all
RegisterType.destroy_all
Location.destroy_all
CoursesType.destroy_all
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
dealer = User.create( email: "dealer@gmail.com",
                    password: "qwerty",
                    first_name: 'Dealer',
                    last_name: 'D',
                    roles_type_code: 'D',
                    nation: "FRANC",
                    language: "EN" )
teacher = User.create( email: "teacher@gmail.com",
                    password: "qwerty",
                    first_name: 'Teacher',
                    last_name: 'T',
                    roles_type_code: 'T',
                    nation: "FRANC",
                    language: "EN" )
participant = User.create( email: "participant@gmail.com",
                    password: "qwerty",
                    first_name: 'Participant',
                    last_name: 'P',
                    roles_type_code: 'P',
                    nation: "FRANC",
                    language: "EN" )
customer = User.create( email: "customer@gmail.com",
                    password: "qwerty",
                    first_name: 'Customer',
                    last_name: 'C V',
                    roles_type_code: 'C',
                    nation: "FRANC",
                    language: "EN" )
manager = User.create( email: "manager@gmail.com",
                    password: "qwerty",
                    first_name: 'Manager',
                    last_name: 'Area M',
                    roles_type_code: 'A',
                    nation: "FRANC",
                    language: "EN" )
puts "*** Created Users ***"
puts "*** Creating Register Types ***"
RegisterType.create(id:1, code:'A', nameEN: 'at')
RegisterType.create(id:2, code:'B', nameEN: 'bet')
RegisterType.create(id:3, code:'C', nameEN: 'cat')
puts "*** Created Register Types ***"

puts "*** Creating Locations ***"
Location.create(name: "10 place andre malraux, 92390, Villeneuve la Garenne",
                nation: "FRANC",
                language: "FR")
Location.create(name: "6 rue du centre, 94016, Cachan",
                nation: "FRANC",
                language: "FR")
Location.create(name: "84 boulevard massena, 75013, Paris",
                nation: "FRANC",
                language: "FR")
puts "*** Created Locations ***"
puts "*** Creating Courses Types ***"
CoursesType.create(note: "Courses type 1 note")
CoursesType.create(note: "Courses type 2 note")
CoursesType.create(note: "Courses type 3 note")
puts "*** Created Courses Types ***"
puts "*** Creating Courses Types ***"
t1 = (Time.now - 7200).strftime('%H:%M')
t2 = (Time.now - 60).strftime('%H:%M')
Course.create(name: "Boarding Sweeper",
      description: "This is a random description",
      language: "FR",
      status: "0",
      start_date: Date.today + 10,
      start_time: t1,
      end_time: t2,
      note: 'this is course note',
      close: 'N',
      max_register: 5,
      courses_type_id:CoursesType.first.id,
      location_id: Location.first.id)
Course.create(name: "How to use a wheel",
      description: "This is a random wheel description",
      language: "FR",
      status: "0",
      start_date: Date.today + 15,
      start_time: t1,
      end_time: t2,
      note: 'this is course note',
      close: 'N',
      max_register: 5,
      courses_type_id:CoursesType.first.id,
      location_id: Location.first.id)      
puts "*** Created Courses ***"