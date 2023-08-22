require "application_responder"

class ApplicationController < ActionController::Base
  before_action :configure_permiited_parameters, if: :devise_controller?
  before_action :authenticate_user!
  self.responder = ApplicationResponder
  respond_to :html

  protected
  def configure_permiited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :display_name, :location, :birthday, :public])
  end

end
