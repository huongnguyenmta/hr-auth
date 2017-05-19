class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    format.html {redirect_to main_app.root_url, notice: exception.message}
  end

  private

  def after_sign_in_path_for resource
    sign_in_url = new_user_session_url

    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
