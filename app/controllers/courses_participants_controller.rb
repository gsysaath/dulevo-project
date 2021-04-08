class CoursesParticipantsController < ApplicationController
  before_action :admin_only, except: [ :quit, :participate ]
  before_action :set_course, only: [ :index, :new, :create, :edit, :update, :quit, :participate ]
  before_action :set_participant, only: [ :edit, :update, :destroy, :quit, :participate ]

  def index
    @participants = CoursesParticipant.where(course: @course)
  end

  def new
    @participant = CoursesParticipant.new
  end

  def create
    @participant = CoursesParticipant.new(courses_participant_params)
    @participant.course = @course
    if @participant.save!
      redirect_to course_courses_participants_path(@course), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @participant.update(courses_participant_params)
      redirect_to course_courses_participants_path(@course), notice: 'Edited succesfully'
    else
      render :edit
    end
  end

  def destroy
    course = @participant.course
    @participant.destroy
    redirect_to course_courses_participants_path(course), notice: 'Deleted successfully'
  end

  def quit
    @sessions = CoursesSession.where(course: @course).order(:start_time)
    @time_limit = @sessions.first.start_time - 10.days
    difference = DateTime.now > @time_limit
    DateTime.now > @time_limit ? @over = true : @over = false
    if (@participant.user == current_user || @role != 'P') && @over == false
      @participant.update!(participate: "N")
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
    if (@participant.user == current_user || @role != 'S') && @over == false
      @participant.update!(participate: "Y")
      redirect_to course_path(@course), notice: "You're participating now"
    else
      redirect_to root_path, notice: "You're not allowed"
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_participant
    @participant = CoursesParticipant.find(params[:id])
  end

  def admin_only
    if (current_user.roles_type_code != 'S' && current_user.roles_type_code != 'A' && current_user.roles_type_code != 'D')
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def courses_participant_params
    params.require(:courses_participant).permit(
      :participate,
      :mail_count,
      :courses_area_manager_id,
      :user_id,
      :course_id,
      :participate,
      :courses_dealer_id)
  end

end
