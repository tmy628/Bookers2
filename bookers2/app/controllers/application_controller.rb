class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    # オンにする必要があるが、リダイレクトされるので一旦解除する→再度オンにする

  def after_sign_in_path_for(resource)
    user_path(resource)
    # ログイン後は（）に遷移する
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
