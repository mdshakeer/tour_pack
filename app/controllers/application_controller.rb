class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :find_page, :only => [:index]

  protected

  def after_sign_in_path_for(users)
    home_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    	user_params.permit(:email, :password, :remember_me)
	  end
  end

  def authorized_user_only_admin
    unless current_user.is_admin?
      unauthorized
    end
  end

  def unauthorized
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/422", layout: false, status: :error }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  def find_page
    @page = params[:page] ? params[:page].to_i : 1
  end
end
