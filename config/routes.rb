Pedidos::Application.routes.draw do


  resources :pedidodetalles

  resources :productos


  resources :categories

  #match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar,
  #:constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :imagen_pedidos

  resources :sitio_entregas

  resources :forma_entregas

  resources :eventos
  resources :pedidos
  resources :admin

  match "/admin/" => "admin#index"
  root :to => "home#index"

  devise_for :users
  resources :users, :only => :show


end
