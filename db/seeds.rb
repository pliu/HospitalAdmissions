# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nurse_teriyaki = User.create!({'password': 'password1', 'email': 'nurse@test.com', role:0})
doctor = User.create!({'password': 'password1', 'email': 'doctor@test.com', role:1})
medical = User.create!({'password': 'password1', 'email': 'medical@test.com', role:2})
staff = User.create!({'password': 'password1', 'email': 'staff@test.com', role:3})

division_er = Division.create!({'charge_nurse': nurse_teriyaki, 'division_name': 'ER', 'location': 'CA',
                                'total_beds': 10, 'extension': '7584'})
patient_easter = Patient.create!({'insurance_string': 'abcde', 'first_name': 'Easter', 'last_name': 'Bunny',
                                  'address': '123 Fake St', 'phone_number': '1234567890',
                                  'dob': DateTime.strptime("01/29/1987 17:00", "%m/%d/%Y %H:%M"),
                                  'gender': 0, 'marital_status': 0})
admission_easter = Admission.create!({'patient': patient_easter, 'division': division_er, 'room_num': 1,
                                      'bed_num': 1})
