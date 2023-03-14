class ApplicationController < ActionController::Base
  include Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  #колбэк указывает данный метод, который вызывается до действия любого девайс контроллера
  #с помощью этого метода можно добавлять различную реализацию работы иных параметров

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
