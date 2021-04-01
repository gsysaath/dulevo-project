class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  skip_before_action :require_no_authentication

  # GET /resource/sign_up
  def new
    if current_user.roles_type_code == 'S'
      @user = User.new
    else
      redirect_to root_path
      flash[:notice] = 'Youre not authorized'
    end
  end

  # POST /resource
  def create
    if current_user.roles_type_code == 'S'
      @user = User.new(users_params)
      @user.showed_password = @user.password
      if @user.save!
        redirect_to users_path
      else
        render :new
      end
    else
      redirect_to root_path
      flash[:notice] = 'Youre not authorized'
    end
  end

  # GET /resource/edit
  def edit
    @user = User.find(params[:format])
  end

  # PUT /resource
  def update
    @user = User.find(params[:id])
    @user.showed_password = @user.password
    if @user.update!(users_params)
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

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nation, :language, :as_400, :note, :area, :roles_type_code, :showed_password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nation, :language, :as_400, :note, :area, :roles_type_code, :showed_password])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    users_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    users_path
  end

  def users_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :nation, :language, :as_400, :note, :area, :roles_type_code)
  end
end
