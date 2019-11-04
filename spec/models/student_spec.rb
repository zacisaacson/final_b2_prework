require 'rails_helper'

describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe "instance methods" do
    before :each do
      @zac = Student.create(name: "Zac")

      @chemistry = Course.create(name: "Chemistry")

      StudentCourse.create(student_id: @zac.id, course_id: @chemistry.id, grade: 80)
    end

    it "finds student grade" do
      zac_grade = @zac.student_grade(@chemistry.id)
      expect(zac_grade).to eq(80.0)
    end
  end

  describe "class methods" do
    before :each do
      @zac = Student.create(name: "Zac Isaacson")
      @einstein = Student.create(name: "Albert Einstein")
      @turing = Student.create(name: "Alan Turing")

      @calculus = Course.create(name: "Calculus")

      StudentCourse.create(student_id: @zac.id, course_id: @calculus.id, grade: 90)
      StudentCourse.create(student_id: @einstein.id, course_id: @calculus.id, grade: 100)
      StudentCourse.create(student_id: @turing.id, course_id: @calculus.id, grade: 95)
    end

    it "will return sorted students" do
      expect(@calculus.students.sorted_students).to eq([@einstein, @turing, @zac])
    end
  end
end
