class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!,except: [:top, :about], unless: :admin_url
  before_action :authenticate_admin!, if: :admin_url
  before_action :configure_permitted_parameters, if: :devise_controller?


  def admin_url
    request.fullpath.include?("/admin")
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :user_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :image ,user_images_attributes: [:image]])
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
