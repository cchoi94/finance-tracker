class User::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_paramenters

    protected
    
    def configure_permitted_paramenters
        devise_parameter_sanitizer.permit(:signup, keys: [:first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
end