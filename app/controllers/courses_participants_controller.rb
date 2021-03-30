class CoursesParticipantsController < ApplicationController
  before_action :admin_only
  before_action :set_course, only: [ :index, :new, :create, :edit, :update ]
  before_action :set_participant, only: [ :edit, :update, :destroy ]

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
      :courses_dealer_id)
  end

end
