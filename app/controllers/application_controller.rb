class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

protected
def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :enrolled, :first_name, :last_name, :street, :city, :state, :zip, :school, :referral, :age, :phone, :image, :card_number, :card_cvv, :card_exp_month, :card_exp_year, :card_name, :promo) }
   devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :enrolled, :first_name, :last_name, :street, :city, :state, :zip, :school, :referral, :age, :phone, :image, :card_number, :card_cvv, :card_exp_month, :card_exp_year, :card_name, :two_week) }
end 

end
