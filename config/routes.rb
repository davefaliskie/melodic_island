Rails.application.routes.draw do

  root 'main_page#index'
 
# *******************RESOURCES********************************************** 
  resources :users
  resources :profile_pictures
  resources :artists
  resources :main_page, only: [:index]
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only:[:new, :create, :edit, :update]
# **************************************************************************


# ********************LOG IN************************************************
  get 'user_sessions/new'
  get 'user_sessions/create'
  get "/register" => "users#new", as: :register 
  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout
# **************************************************************************


# **********************SONGS***********************************************
  match "/songs/index",   :as => "songs",   :via => :get
  match "/songs/delete",  :as => "delete",  :via => [:get, :post]
  match "/songs/add",     :as => "add",     :via => :get
  match "/songs/upload",  :as => "upload",  :via => :post
# **************************************************************************

end
