Rails.application.routes.draw do

  root 'main_page#index'
 
# *******************RESOURCES********************************************** 
  resources :users
  resources :profile_pictures
  resources :artists
  resources :main_page, only: [:index]
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only:[:new, :create, :edit, :update]
  resources :audios
# **************************************************************************


# ********************LOG IN************************************************
  get 'user_sessions/new'
  get 'user_sessions/create'
  get "/register" => "users#new", as: :register 
  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout
# **************************************************************************


end
