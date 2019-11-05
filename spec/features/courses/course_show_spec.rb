require 'rails_helper'

RSpec.describe 'Course show page' do
  before (:each) do
    @zac = Student.create(name: "Zac Isaacson")
    @einstein = Student.create(name: "Albert Einstein")
    @turing = Student.create(name: "Alan Turing")

    @calculus = Course.create(name: "Calculus")

    StudentCourse.create(student_id: @zac.id, course_id: @calculus.id, grade: 90)
    StudentCourse.create(student_id: @einstein.id, course_id: @calculus.id, grade: 100)
    StudentCourse.create(student_id: @turing.id, course_id: @calculus.id, grade: 95)
  end
  it "will show course name and sorted students" do

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

  it "can unenroll a student" do
    visit "/courses/#{@calculus.id}"

    within '#student-0' do
      click_link 'Unenroll'
    end

    expect(current_path).to eq("/students/#{@einstein.id}")

    expect(page).to_not have_content('Calculus')
  end
# As a user,
# When I visit a course show page,
# Then I see a button 'unenroll' next to each student's name
# When I click this button,
# Then I am redirected to that student's show page where I do not see the course listed
end
