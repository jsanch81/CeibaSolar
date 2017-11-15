Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"
  get "home/about"
  get "home/menu"

  post "home/post"
  post "home/post2"
  get "home/show"

  get "home/temperatura"
  get "home/humedad"
  get "home/windspeed"
  get "home/dirwind"
  get "home/presionAtm"
  get "home/precipitacion"
  get "home/createUser"
  get "home/consumo"
  get "home/ambiente"
  post "home/createUserP"
  get ":controller/:action/:id"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
