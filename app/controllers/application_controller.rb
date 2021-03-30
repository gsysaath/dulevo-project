class ApplicationController < ActionController::Base
  before_action :set_languages, :set_role
  before_action :authenticate_user!

  private

  def set_languages
    @languages = %i(IT EN FR DE ES)
  end

  def set_role
    @role = current_user.roles_type_code if user_signed_in?
  end
end
