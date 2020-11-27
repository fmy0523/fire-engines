class ApplicationController < ActionController::Base
  # ログインしていない状態でアクセスされた場合は、ログイン画面へリダイレクト
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
