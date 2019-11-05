require 'rails_helper'

RSpec.describe 'Course show page' do
  it "will show course name and sorted students" do

    @zac = Student.create(name: "Zac Isaacson")
    @einstein = Student.create(name: "Albert Einstein")
    @turing = Student.create(name: "Alan Turing")

    @calculus = Course.create(name: "Calculus")

    StudentCourse.create(student_id: @zac.id, course_id: @calculus.id, grade: 90)
    StudentCourse.create(student_id: @einstein.id, course_id: @calculus.id, grade: 100)
    StudentCourse.create(student_id: @turing.id, course_id: @calculus.id, grade: 95)

    visit "/courses/#{@calculus.id}"

    within '#student-0' do
      expect(page).to have_content(@einstein.name)
    end
    within '#student-1' do
      expect(page).to have_content(@turing.name)
    end
    within '#student-2' do
      expect(page).to have_content(@zac.name)
    end
  end
end
