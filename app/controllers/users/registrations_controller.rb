# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   skip_before_action :require_no_authentication, only: [:new, :create]
   #this can be called off if necessary
   #before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   #before_action :authenticate_user!

   after_action :verify_authorized, except:  [:index], unless: :devise_controller?
   after_action :verify_policy_scoped, except: [:index,:show, :new, :create], unless: :skip_pundit?

  # GET /resource/sign_up
  # this is being used while user signup
   def new
    
     super 
     @user = User.new
     #debugger
     authorize @user
     #debugger
   end

  # POST /resource
   def create
     super
     #debugger
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
end
