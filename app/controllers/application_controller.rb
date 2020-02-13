class ApplicationController < ActionController::Base

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception


    before_action :configure_permitted_parameters, if: :devise_controller?
    #Dont use before filter here

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :role, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
            #Dont use .for here
        end

    private

        def user_not_authorized
            flash[:alert] = "You are not authorized to do this task"
            #if not this then it will just show the blank page
            redirect_to root_path 
        end
end
