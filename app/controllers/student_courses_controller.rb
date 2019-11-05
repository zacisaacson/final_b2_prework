class StudentCoursesController < ApplicationController

  def destroy
    student = Student.find(params[:id])
    student.student_courses.where(student_id: student.id).first.destroy
    redirect_to "/students/#{student.id}"
  end

  def create
    course = Course.find(params[:id])
    student = Student.create(student_params)
    student.save
    course = StudentCourse.create(student_id: student.id, course_id: course.id, grade: 80)
    course.save
    redirect_to "/students/#{student.id}"
  end

  private

  def student_params
    params.permit(:name)
  end

  # def student_course_params
  #   params.permit(:student_id, :course_id, grade: 80)
  # end

end
