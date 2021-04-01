class ApplicationController < ActionController::Base
  before_action :set_languages, :set_role
  before_action :authenticate_user!
  before_action :set_locale

  private

  def set_languages
    @languages = %i(IT EN FR DE ES)
  end

  def set_role
    @role = current_user.roles_type_code if user_signed_in?
  end

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language.downcase
    else
      I18n.locale = I18n.default_locale
    end
  end

end
