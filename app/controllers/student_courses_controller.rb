class StudentCoursesController < ApplicationController

  def destroy
    student = Student.find(params[:id])
    student.student_courses.where(student_id: student.id).first.destroy
    redirect_to "/students/#{student.id}"
  end

end
