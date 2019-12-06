class StudentsController < ApplicationController

  def index
    @students = Student.all.order(:name)
  end
  
  def show 
    @student = Student.find(params[:student_id])
  end
end