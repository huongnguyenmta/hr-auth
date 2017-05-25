class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = @users.page params[:page]
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = "Create success"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = "Update success"
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
