class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  	protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
		categories_path
	end

	protected

	def configure_permitted_parameters
    added_attrs = [:username, :phoneno, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
