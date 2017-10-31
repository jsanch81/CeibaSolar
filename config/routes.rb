Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"
  get "home/about"
  get "home/menu"

  post "graph/post"
  get "graph/show"
  get "graph/tabla"  
  get "home/createUser"
  post "home/createUserP"
  get ":controller/:action/:id"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
