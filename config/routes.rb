Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  root to: 'pages#landing'
  get   '/home'     => 'pages#home', as: 'home'

  get   '/login'    => 'session#new'        # show the login form
  post  '/login'    => 'session#create'     # form submits to here, performs login, redirect
  delete '/login'   => 'session#destroy'    # logout link goes here, performs logout, redirect
  
  resources :users

  resources :suits
  resources :carts
  resources :profiles
end
