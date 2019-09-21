# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_paramenters

  protected

  def configure_permitted_paramenters
    devise_parameter_sanitizer.permit(:signup, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
end
