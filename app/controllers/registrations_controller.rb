class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  protected

  def after_sign_up_path_for(user)
    edit_profile_path(user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :is_speaker
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
