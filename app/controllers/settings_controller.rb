class SettingsController < ApplicationController
  def change_language
    l = params[:language].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:language] = l
    redirect_to request.referer || root_url
  end
end
