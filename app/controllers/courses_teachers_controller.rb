class CoursesTeachersController < ApplicationController
  before_action :admin_only
  before_action :set_course, only: [ :index, :new, :create, :edit, :update ]
  before_action :set_teacher, only: [ :edit, :update, :destroy ]

  def index
    @teachers = CoursesTeacher.where(course: @course)
  end

  def new
    @teacher = CoursesTeacher.new
  end

  def create
    @teacher = CoursesTeacher.new(courses_teacher_params)
    @teacher.course = @course
    if @teacher.save!
      redirect_to course_courses_teachers_path(@course), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @teacher.update(courses_teacher_params)
      redirect_to course_courses_teachers_path(@course), notice: 'Edited succesfully'
    else
      render :edit
    end
  end

  def destroy
    course = @teacher.course
    @teacher.destroy
    redirect_to course_courses_teachers_path(course), notice: 'Deleted successfully'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_teacher
    @teacher = CoursesTeacher.find(params[:id])
  end

  def admin_only
    if (current_user.roles_type_code != 'S' && @role != 'A')
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def courses_teacher_params
    params.require(:courses_teacher).permit(
      :participate,
      :user_id,
      :course_id)
  end

end
