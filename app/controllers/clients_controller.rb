class ClientsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource only: [:show, :destroy]

  def index
    @clients = current_user.clients
  end

  def create
    @client = current_user.clients.build client_params

    if @client.save
      flash[:success] = "Create success"
    else
      flash[:notice] = "Create failed"
    end
    redirect_to root_path
  end

  def destroy
    if @client.destroy
      flash[:success] = "Destroy success"
    else
      flash[:notice] = "Destroy failed"
    end
    redirect_to root_path
  end

  private

  def client_params
    params.require(:client).permit :name
  end
end
