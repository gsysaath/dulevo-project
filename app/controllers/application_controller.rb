class ApplicationController < ActionController::Base
  before_action :set_languages

  private

  def set_languages
    @languages = %i(IT EN FR DE ES)
  end
end
