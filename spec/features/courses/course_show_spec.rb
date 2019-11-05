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

  it "can enroll a new student" do
    visit "/courses/#{@calculus.id}"

    expect(page).to have_content "Add New Student"

    fill_in :name, with: "Johhny Bravo"

    click_button 'Submit'

    new_student = Student.last

    expect(current_path).to eq("/students/#{new_student.id}")

    expect(page).to have_content('Calculus')
  end

  # When I visit a course show page,
  # Then I see a form to enroll a new student in this course that has a single input field for the student name.
  # When I type in the name of a student
  # And I click the submit button
  # Then a new student is created,
  # And I am redirected to that student's show page where I see the course listed
  # (no need for sad path testing i.e. name field is left blank, if the name already exists)
end
