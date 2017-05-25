class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def update
    if @user.save
      flash[:success] = "Update success"
      redirect_to @user
    else
      flash.now[:notice] = "Update failed"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
