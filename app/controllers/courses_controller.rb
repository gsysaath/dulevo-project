class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update users_update ]
  before_action :admin_only, only: %i[new create edit update no_sessions]

  def index
    if @role == 'S'
      @courses_sessions = CoursesSession.all.order(:start_time)
    elsif @role == 'A'
      @courses = CoursesAreaManager.where(user: current_user)
      @courses_sessions = CoursesSession.where(course: @courses).order(:start_time)
    elsif @role == 'D'
      @courses = CoursesDealer.where(user: current_user)
      @courses_sessions = CoursesSession.where(course: @courses).order(:start_time)
    elsif @role == 'T'
      @courses = CoursesTeacher.where(user: current_user)
      @courses_sessions = CoursesSession.where(course: @courses).order(:start_time)
    elsif @role == 'P'
      @courses = CoursesParticipant.where(user: current_user)
      @courses_sessions = CoursesSession.where(course: @courses).order(:start_time)
    end
  end

  def no_sessions
    @courses = Course.all
  end


  def show
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @dealers = CoursesDealer.where(course: @course)
    @teachers = CoursesTeacher.where(course: @course)
    @participants = CoursesParticipant.where(course: @course)
    @registers = CoursesRegister.where(course: @course)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course), notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course), notice: 'Updated successfully'
    else
      render :edit
    end
  end


  def destroy
    @course.destroy
    redirect_to courses_path, notice: 'Deleted successfully'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      :language,
      :status,
      :start_date,
      :start_time,
      :end_time,
      :note,
      :close,
      :max_register,
      :courses_type_id,
      :location_id)
  end
end
