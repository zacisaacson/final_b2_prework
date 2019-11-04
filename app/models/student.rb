class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :courses, through: :student_courses

  def student_grade(id)
    student_courses.where(course_id: id).take.grade
  end

  def self.sorted_students
    joins(:student_courses).order('student_courses.grade desc').uniq
  end
end
