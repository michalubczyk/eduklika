class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      if current_user.function == "teacher"
        @courses = current_user.courses.search(params[:search])
      elsif current_user.function == "student"
        @courses = current_user.group.courses.search(params[:search])
      end
    else
      if current_user.function == "teacher"
        @courses = current_user.courses.all
      elsif current_user.function == "student"
        @courses = current_user.group.courses.all
      end
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_path, :notice => "Kurs został utworzony."
    else
      render "new"
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to courses_path, :notice => "Kurs został zaktualizowany."
    else
      render "edit"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy!
    redirect_to courses_path, :notice => "Kurs został usunięty."
  end
end
