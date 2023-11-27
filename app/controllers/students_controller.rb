class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    render json: StudentDecorator.new(@student).as_json
  end

  def index
    @students = Student.includes(:address, :scores, :teacher).all
    render json: @students.map { |student| StudentDecorator.new(student).as_json }
  end  
end