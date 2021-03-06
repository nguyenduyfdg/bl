class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:ten_kh, :email, :password, :password_confirmation, :dien_thoai])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:ten_kh, :password, :password_confirmation, :dien_thoai, :current_password, :dia_chi, :ma_so_thue])
  	end

end
