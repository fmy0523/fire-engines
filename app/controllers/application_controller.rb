class ApplicationController < ActionController::Base

  # ログインしていない状態でアクセスされた場合は、ログイン画面へリダイレクト
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
        flash[:notice] = "Signed in successfully."
        fire_engines_path
  end

  def after_sign_out_path_for(resource)
        flash[:alert] = "Signed out successfully."
        root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
