Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "clients#index"
  end

  unauthenticated :user do
    devise_scope :user do
      root "devise/sessions#new"
    end
  end

  get "/auth/hr_system/authorize" => "auth#authorize"
  post "/auth/hr_system/access_token" => "auth#access_token"
  get "/me" => "auth#me"

  resources :clients, only: [:index, :create, :show, :destroy]
end
