class RegisterTypesController < ApplicationController
  before_action :set_register_type, only: %i[edit update destroy]
  before_action :admin_only

  def index
    @register_types = RegisterType.all
  end

  def new
    @register_type = RegisterType.new
  end

  def create
    @register_type = RegisterType.new(register_type_params)
    if @register_type.save
      redirect_to register_types_path, notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @register_type.update(register_type_params)
      redirect_to register_types_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @register_type.destroy
    redirect_to register_types_path, notice: 'Deleted successfully'
  end

  private

  def set_register_type
    @register_type = RegisterType.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def register_type_params
    params.require(:register_type).permit(:code, :nameIT, :nameEN, :nameFR, :nameDE, :nameES)
  end
end
