class LocationsController < ApplicationController
  before_action :set_location, only: %i[edit update destroy]
  before_action :admin_only

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path, notice: 'Created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path, notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: 'Deleted successfully'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def admin_only
    if current_user.roles_type_code != 'S'
      redirect_to root_path
      flash[:alert] = "You are not authorized!"
    end
  end

  def location_params
    params.require(:location).permit(:name, :nation, :language)
  end
end
