puts "*** Destroy seeds ***"
Course.destroy_all
RolesType.destroy_all
User.destroy_all
RegisterType.destroy_all
Location.destroy_all
CoursesType.destroy_all
CoursesSession.destroy_all
CoursesAreaManager.destroy_all
CoursesDealer.destroy_all
CoursesParticipant.destroy_all
CoursesTeacher.destroy_all
CoursesRegister.destroy_all
puts "*** Destroy seeds finished ***"
puts "*** Creating RolesTypes ***"
# DEALER CONCESSIONARY AND CUSTOMER ARE DEALERS
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
Location.create(name: "online",
                nation: "ONLINE",
                language: "ON")           
Location.create(name: "6 rue du centre, 94016, Cachan",
                nation: "FRANC",
                language: "FR")
Location.create(name: "84 boulevard massena, 75013, Paris",
                nation: "FRANC",
                language: "FR")
puts "*** Created Locations ***"
puts "*** Creating Courses Types ***"
CoursesType.create(note: "Courses type 1 note", image_path: "120")
CoursesType.create(note: "Courses type 2 note", image_path: "120")
CoursesType.create(note: "Courses type 3 note", image_path: "900")
puts "*** Created Courses Types ***"
puts "*** Creating Courses Types ***"
Course.create(name: "Boarding Sweeper",
      description: "This is a random description",
      language: "FR",
      status: "0",
      note: 'this is course note',
      close: 'N',
      max_register: 10,
      courses_type_id:CoursesType.first.id,
      location_id: Location.first.id)
Course.create(name: "How to use a wheel",
      description: "This is a random wheel description",
      language: "FR",
      status: "0",
      note: 'this is course note',
      close: 'N',
      max_register: 5,
      courses_type_id:CoursesType.first.id,
      location_id: Location.first.id)      
puts "*** Created Courses ***"
puts "*** Creating Courses Sessions ***"
CoursesSession.create(start_time: Time.new(2021, 03, 31, 8, 0, 0, "+02:00"),
                      end_time: Time.new(2021, 03, 31, 17, 0, 0, "+02:00"),
                      course_id: Course.first.id)
CoursesSession.create(start_time: Time.new(2021, 04, 31, 8, 0, 0, "+02:00"),
                      end_time: Time.new(2021, 04, 31, 17, 0, 0, "+02:00"),
                      course_id: Course.first.id)
CoursesSession.create(start_time: Time.new(2021, 05, 10, 8, 0, 0, "+02:00"),
                      end_time: Time.new(2021, 05, 10, 17, 0, 0, "+02:00"),
                      course_id: Course.first.id)
CoursesSession.create(start_time: Time.new(2021, 06, 01, 8, 0, 0, "+02:00"),
                      end_time: Time.new(2021, 06, 01, 17, 0, 0, "+02:00"),
                      course_id: Course.last.id)
puts "*** Created Courses Sessions ***"
puts "*** Creating Courses Area Manager ***"
CoursesAreaManager.create(participate: "Y",
                          user_id: 6,
                          course_id: 1)
CoursesAreaManager.create(participate: "N",
                          user_id: 6,
                          course_id: 2)
puts "*** Created Courses Area Manager ***"
puts "*** Creating Courses Dealers ***" 
CoursesDealer.create(participate: "Y",
                          user_id: 2,
                          course_id: 1)
CoursesDealer.create(participate: "N",
                          user_id: 2,
                          course_id: 2)
puts "*** Created Courses Dealers ***"
puts "*** Creating Courses Participants ***"
CoursesParticipant.create(user_id: 4,
                          course_id: 1,
                          courses_area_manager_id: 1,
                          courses_dealer_id: 1
                        )
CoursesParticipant.create(user_id: 4,
                          course_id: 2,
                          courses_area_manager_id: 2,
                          courses_dealer_id: 2
                          )
puts "*** Created Courses Participants ***"
puts "*** Creating Courses Registers ***"
CoursesRegister.create(course_id: 1,
                       courses_participant_id: 1,
                       register_type_code: 'A',
                       employee: true,
                      people: "Andre")
CoursesRegister.create(course_id: 1,
                       courses_participant_id: 1,
                       register_type_code: 'B',
                       employee: true,
                      people: "Bastos")
CoursesRegister.create(course_id: 1,
                       courses_participant_id: 1,
                       register_type_code: 'C',
                       employee: false,
                      people: "Paul")
CoursesRegister.create(course_id: 2,
                       courses_participant_id: 2,
                       register_type_code: 'A',
                       employee: false,
                      people: "Jessica")

puts "*** Created Courses Registers ***"
puts "*** Creating Courses Teachers ***"
CoursesTeacher.create(user_id: 3,
                      participate: "Y",
                      course_id: 1)
CoursesTeacher.create(user_id: 3,
                      participate: "N",
                      course_id: 2)
puts "*** Created Courses Teachers ***"