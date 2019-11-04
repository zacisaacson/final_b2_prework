# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@zac = Student.create(name: "Zac Isaacson")
@einstein = Student.create(name: "Albert Einstein")
@turing = Student.create(name: "Alan Turing")

@chemistry = Course.create(name: "Chemistry")
@calculus = Course.create(name: "Calculus")
@history = Course.create(name: "History")
@comp_sci = Course.create(name: "Computer Science")

@chemistry.student_courses.create(student_id: @zac.id, grade: 80)
@chemistry.student_courses.create(student_id: @turing.id, grade: 75)
@calculus.student_courses.create(student_id: @turing.id, grade: 95)
@calculus.student_courses.create(student_id: @zac.id, grade: 90)
@calculus.student_courses.create(student_id: @einstein.id, grade: 100)
@comp_sci.student_courses.create(student_id: @zac.id, grade: 97)
@comp_sci.student_courses.create(student_id: @einstein.id, grade: 82)
@comp_sci.student_courses.create(student_id: @turing.id, grade: 89)
@history.student_courses.create(student_id: @einstein.id, grade: 85)
