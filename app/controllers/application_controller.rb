class ApplicationController < ActionController::Base
    #call the configured params
    before_action :configure_permitted_parameters, if: :devise_controller?

    # protect database,while allowing this fields to be updated
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me]) 
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :password_confirmation, :remember_me])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :remember_me])
    end

end
