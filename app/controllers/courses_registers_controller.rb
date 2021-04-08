class CoursesRegistersController < ApplicationController
  before_action :set_course, only: [ :index, :new, :create, :edit, :update, :quit, :participate ]
  before_action :set_register, only: [ :edit, :update, :destroy, :quit, :participate ]
  before_action :authorized_people, except: [ :destroy ]

  def index
    @registers = CoursesRegister.where(course: @course)
  end

  def new
    @register = CoursesRegister.new
    @registers_total = CoursesRegister.where(course: @course).count
    if @registers_total >= @course.max_register
      redirect_to course_courses_registers_path(@course), notice: "No more places"
    end
  end

  def create
    @register = CoursesRegister.new(courses_register_params)
    @register.course = @course
    @registers_total = CoursesRegister.where(course: @course).count

    if @register.save! && @registers_total < @course.max_register
      redirect_to course_courses_registers_path(@course), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @register.update(courses_register_params)
      redirect_to course_courses_registers_path(@course), notice: 'Edited succesfully'
    else
      render :edit
    end
  end

  def destroy
    course = @register.course
    @register.destroy
    redirect_to course_courses_registers_path(course), notice: 'Deleted successfully'
  end

  def quit
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @time_limit = @sessions.first.start_time - 10.days
    difference = DateTime.now > @time_limit
    DateTime.now > @time_limit ? @over = true : @over = false
    if (@register.participant.user == current_user || @role != 'P') && @over == false
      @register.update!(participate: "N")
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
    if (@register.participant.user == current_user || @role != 'S') && @over == false
      @register.update!(participate: "Y")
      redirect_to course_path(@course), notice: "You're participating now"
    else
      redirect_to root_path, notice: "You're not allowed"
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_register
    @register = CoursesRegister.find(params[:id])
  end

  def authorized_people
    if @role == 'A' && CoursesAreaManager.where(course: @course, user: current_user).empty?
      redirect_to root_path, notice: "You're not authorized"
    elsif @role == 'D' && CoursesDealer.where(course: @course, user: current_user).empty?
      redirect_to root_path, notice: "You're not authorized"
    elsif @role == 'P' && CoursesParticipant.where(course: @course, user: current_user).empty?
      redirect_to root_path, notice: "You're not authorized"
    elsif @role == 'T' && CoursesTeacher.where(course: @course, user: current_user).empty?
      redirect_to root_path, notice: "You're not authorized"
    end 
  end

  def courses_register_params
    params.require(:courses_register).permit(
      :people,
      :vote,
      :rating,
      :email,
      :telephone,
      :participate,
      :employee,
      :register_type_code,
      :courses_participant_id,
      :course_id)
  end
end
