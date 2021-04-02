class CoursesTeachersController < ApplicationController
  before_action :admin_only, except: [ :quit, :participate ]
  before_action :set_course, only: [ :index, :new, :create, :edit, :update, :quit, :participate ]
  before_action :set_teacher, only: [ :edit, :update, :destroy, :quit, :participate ]

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

  def quit
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @time_limit = @sessions.first.start_time - 10.days
    difference = DateTime.now > @time_limit
    DateTime.now > @time_limit ? @over = true : @over = false
    if (@teacher.user == current_user || @role == 'S') && @over == false
      @teacher.update!(participate: "N")
      redirect_to course_path(@course), notice: "You're not participating anymore"
    else
      redirect_to root_path, notice: "You're not allowed"
    end
  end

  def participate
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @time_limit = @sessions.first.start_time - 10.days
    difference = DateTime.now > @time_limit
    DateTime.now > @time_limit ? @over = true : @over = false
    if (@teacher.user == current_user || @role == 'S') && @over == false
      @teacher.update!(participate: "Y")
      redirect_to course_path(@course), notice: "You're participating now"
    else
      redirect_to root_path, notice: "You're not allowed"
    end
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
