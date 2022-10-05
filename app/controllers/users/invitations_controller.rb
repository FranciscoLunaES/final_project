class Users::InvitationsController < Devise::InvitationsController
  skip_before_action :authorize!, only: %i[edit update]
  grant(
    manager: :all,
    admin: :all
  )
  before_action :configure_permitted_parameters

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: %i[name surname authorization_tier password])
  end
end
