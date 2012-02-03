Pedidos::Application.routes.draw do

  resources :imagen_pedidos

  resources :sitio_entregas

  resources :forma_entregas

  resources :eventos
  resources :pedidos

  root :to => "home#index"

  devise_for :users
  resources :users, :only => :show


end
