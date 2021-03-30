class CoursesAreaManagersController < ApplicationController
  before_action :admin_only
  before_action :set_course, only: [ :index, :new, :create, :edit, :update ]
  before_action :set_manager, only: [ :edit, :update, :destroy ]

  def index
    @managers = CoursesAreaManager.where(course: @course)
  end

  def new
    @manager = CoursesAreaManager.new
  end

  def create
    @manager = CoursesAreaManager.new(courses_area_manager_params)
    @manager.course = @course
    if @manager.save!
      redirect_to course_courses_area_managers_path(@course), notice: 'Saved successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @manager.update(courses_area_manager_params)
      redirect_to course_courses_area_managers_path(@course), notice: 'Edited succesfully'
    else
      render :edit
    end
  end

  def destroy
    course = @manager.destroy
    @manager.destroy
    redirect_to course_courses_area_managers_path(course), notice: 'Deleted successfully'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_manager
    @manager = CoursesAreaManager.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def courses_area_manager_params
    params.require(:courses_area_manager).permit(
      :participate,
      :user_id,
      :course_id)
  end

end