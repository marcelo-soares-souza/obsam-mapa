class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
 
  protected

  def set_locale
    I18n.default_locale = "pt-BR"
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:fullname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
  end

  def check_if_user_owner(id)
    if signed_in?
      if ! current_user.admin? and current_user.slug != id
        redirect_to root_url, alert: "Permission Denied"
      end
    end
  end

  def check_owner(user_id)
    if signed_in?
      if ! current_user.admin? and current_user.id != user_id
        redirect_to root_url, alert: "Permission Denied"
      end
    end
  end

  def check_if_admin
    if signed_in?
      if ! current_user.admin?
        redirect_to root_url, alert: "Permission Denied"
      end
    end
  end

  def load_tipos_subtipos
    @tipos = { "CAPS" => "CAPS", 
               "Unidade de Acolhimento" => "Unidade de Acolhimento", 
               "Ambulatório AD" => "Ambulatório AD",
               "Comunidade Terapêutica" => "Comunidade Terapêutica" }

    @subtipos = { "CAPS AD" => "CAPS AD",
                  "CAPS Transtorno" => "CAPS Transtorno",
                  "CAPSi" => "CAPSi",
                  "Outro" => "Outro" }

    @icons = { "CAPS" => "red", 
               "Unidade de Acolhimento" => "yellow", 
               "Ambulatório AD" => "green",
               "Comunidade Terapêutica" => "blue" }
  end
end
