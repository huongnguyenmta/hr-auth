class Admin::BaseController < ApplicationController
  before_action :verify_admin!

  private

  def verify_admin!
    return if current_user.admin?

    flash[:notice] = "Accessed denied!!!"
    redirect_to root_url
  end
end
