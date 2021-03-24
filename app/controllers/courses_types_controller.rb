class CoursesTypesController < ApplicationController
  before_action :set_courses_type, only: %i[edit update destroy]
  before_action :admin_only

  def index
    @courses_types = CoursesType.all
  end

  def new
    @courses_type = CoursesType.new
  end

  def create
    @courses_type = CoursesType.new(courses_type_params)
    if @courses_type.save
      redirect_to courses_types_path, notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @courses_type.update(courses_type_params)
      redirect_to courses_types_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @courses_type.destroy
    redirect_to courses_types_path, notice: 'Deleted successfully'
  end

  private

  def set_courses_type
    @courses_type = CoursesType.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def courses_type_params
    params.require(:courses_type).permit(:note)
  end
end
