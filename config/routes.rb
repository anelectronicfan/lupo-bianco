Rails.application.routes.draw do
  
  root to: 'pages#landing'
  get   '/home'     => 'pages#home', as: 'home'

  get   '/login'    => 'session#new'        # show the login form
  post  '/login'    => 'session#create'     # form submits to here, performs login, redirect
  delete '/login'   => 'session#destroy'    # logout link goes here, performs logout, redirect
  
  
  resources :users, except: [:show]
  
  resources :suits
  resources :carts, except: [:new, :edit, :update, :destroy]
  get 'thanks', to: 'carts#thanks', as: 'thanks'
  resources :profiles
end
