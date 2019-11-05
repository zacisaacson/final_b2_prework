require 'rails_helper'

RSpec.describe 'Student show page' do
  it "will show students name, course name, grade" do

    @zac = Student.create(name: "Zac")

    @chemistry = Course.create(name: "Chemistry")
    @calculus = Course.create(name: "Calculus")

    StudentCourse.create(student_id: @zac.id, course_id: @chemistry.id, grade: 80)
    StudentCourse.create(student_id: @zac.id, course_id: @calculus.id, grade: 90)

    visit "/students/#{@zac.id}"

    expect(page).to have_content("Zac")
    expect(page).to have_content("Course: Chemistry - Grade: 80")
    expect(page).to have_content("Course: Calculus - Grade: 90")
  end
end
