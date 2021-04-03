class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path(resource)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    # 新規登録の際、nameの情報を送ってもいいように許可する
  end
end
