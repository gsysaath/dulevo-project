class CoursesSessionsController < ApplicationController
  before_action :admin_only
  before_action :set_course, only: [ :new, :create, :edit, :update ]
  before_action :set_session, only: [ :edit, :update, :destroy ]

  def new
    @session = CoursesSession.new
  end

  def create
    @session = CoursesSession.new(courses_session_params)
    @session.course = @course
    if @session.save!
      redirect_to course_path(@course), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @session.update(courses_session_params)
      redirect_to course_path(@course), notice: 'Edited succesfully'
    else
      render :edit
    end
  end

  def destroy
    course = @session.course
    @session.destroy
    redirect_to course_path(course), notice: 'Deleted successfully'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_session
    @session = CoursesSession.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def courses_session_params
    params.require(:courses_session).permit(
      :start_time,
      :end_time,
      :course_id)
  end
end
