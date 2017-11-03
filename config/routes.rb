Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"
  get "home/about"
  get "home/menu"

  post "home/post"
  get "home/show"
  get "home/tabla"
  get "home/createUser"
  get "home/consumo"
  get "home/ambiente"
  post "home/createUserP"
  get ":controller/:action/:id"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
