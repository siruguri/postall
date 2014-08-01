TestDk::Application.routes.draw do
  # Added API and Doorkeeper
  namespace :api, defaults: {format: 'json'} do
    resources :tasks
  end

  use_doorkeeper

  resources :categories

  resources :navbar_entries
  resources :locations
  resources :tasks
  
  devise_for :users

  resources :users, path: 'profiles'
  root to: 'tasks#index'

  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque"

  namespace :api do
    namespace :v1 do


    end
  end

  # Need a catch all to redirect to the errors controller, for catching 404s as an exception
  match "*path", to: "errors#catch_404", via: [:get, :post]

end
