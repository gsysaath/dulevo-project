class CoursesRegistersController < ApplicationController
  before_action :admin_only
  before_action :set_course, only: [ :index, :new, :create, :edit, :update ]
  before_action :set_register, only: [ :edit, :update, :destroy ]

  def index
    @registers = CoursesRegister.where(course: @course)
  end

  def new
    @register = CoursesRegister.new
  end

  def create
    @register = CoursesRegister.new(courses_register_params)
    @register.course = @course
    if @register.save!
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

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_register
    @register = CoursesRegister.find(params[:id])
  end

  def admin_only
    if (current_user.roles_type_code != 'S' && @role != 'D' && @role != 'A')
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
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
      :register_type_code,
      :courses_participant_id,
      :course_id)
  end
end
