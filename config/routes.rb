TestDk::Application.routes.draw do
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
end
