class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update users_update admin_cancel]
  before_action :admin_only, only: %i[new create edit update admin_cancel]

  def index
    @courses = Course.all
    if current_user.roles_type_code != 'S'
      @if_admin = true
    else
      @if_admin = false
    end 
  end

  def show
    if current_user.roles_type_code != 'S'
      @if_admin = true
    else
      @if_admin = false
    end

  end

  def new
    @course = Course.new
  end

  def users_update
    roles_type_code = current_user.roles_type_code
  end

  # CANCEL THE COURSE SHORTCUT
  # def admin_cancel
  #   @course.status = -1
  #   if @course.save
  #     redirect_to courses_path, notice: 'Status changed'
  #   else
  #     redirect_to courses_path, notice: 'Status change failed'
  #   end
  # end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: 'Updated successfully'
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
