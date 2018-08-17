class ApplicationController < ActionController::Base
  before_action :set_language

  def set_language
    if cookies[:language]
      l = cookies[:language].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:locale] = l
    end
    I18n.locale = l
  end
end
