class RolesTypesController < ApplicationController
  before_action :set_roles_type, only: %i[edit update destroy]
  before_action :admin_only

  def index
    @roles_types = RolesType.all
  end

  def new
    @roles_type = RolesType.new
  end

  def create
    @roles_type = RolesType.new(roles_type_params)
    if @roles_type.save
      redirect_to roles_types_path, notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @roles_type.update(roles_type_params)
      redirect_to roles_types_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @roles_type.destroy
    redirect_to roles_types_path, notice: 'Deleted successfully'
  end

  private

  def set_roles_type
    @roles_type = RolesType.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def roles_type_params
    params.require(:roles_type).permit(:code, :nameIT, :nameEN, :nameFR, :nameDE, :nameES)
  end
end
