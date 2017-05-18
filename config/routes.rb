Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/auth/hr_system/authorize" => "auth#authorize"
  post "/auth/hr_system/access_token" => "auth#access_token"
  get "/me" => "auth#me"
end
