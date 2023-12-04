class RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_photo, :first_name, :last_name, :email, :password, :password_confirmation, :current_password])
  end
end
