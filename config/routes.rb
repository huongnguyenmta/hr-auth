Rails.application.routes.draw do
  root "clients#index"
  devise_for :users
  get "/auth/hr_system/authorize" => "auth#authorize"
  post "/auth/hr_system/access_token" => "auth#access_token"
  get "/me" => "auth#me"

  resources :clients, only: [:index, :create, :show, :destroy]
end
