class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @users = User.all
  end

    # GET /resource/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /resource
  def update
    @user = User.find(params[:id])
    save = @user.showed_password
    @user.update(users_params)
    @user.showed_password = params["user"]["password"]
    if @user.showed_password.nil?
      @user.showed_password = save
    end
    if @user.save!
      redirect_to users_path, notice: "Updated Successfully"
    else
      render :edit
    end
  end

  # DELETE /resource
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "Deleted Successfully"
  end


  private

  def set_user
    if current_user.roles_type_code != 'S'
      redirect_to root_path, notice: "You're not authorized"
    end
  end

  def users_params
    params.require(:user).permit(:email, :password, :showed_password, :first_name, :last_name, :nation, :language, :as_400, :note, :area, :roles_type_code)
  end
end