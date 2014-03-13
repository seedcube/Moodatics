class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception   
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  

  
  private

 # def current_user 
 #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 # end
 # helper_method :current_user

 # def authorize
 #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
 # end
 # def authorize_doctor
 #   redirect_to login_url, alert: "Not authorized" if current_user.nil? && current_user.role_id == 1
 # end    
 
 protected
 
 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role_id, :email, :password, :password_confirmation, :first_name, :last_name, :middle_name,:username) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
 end
  
end
