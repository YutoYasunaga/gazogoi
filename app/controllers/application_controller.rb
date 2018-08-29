class ApplicationController < ActionController::Base
  before_action :set_language

  def check_admin
    unless user_signed_in? && (current_user.role == 'admin' || current_user.role == 'owner')
      redirect_to root_path
      flash[:danger] = "Permission denied!"
    end
  end

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
