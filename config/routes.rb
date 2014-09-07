TestDk::Application.routes.draw do

  # I like having this to populate the navbar with, via the database rather than do it in the views.
  resources :navbar_entries

  # Logins and Profiles
  devise_for :users
  resources :users, path: 'profiles'

  root to: 'tasks#index' # Change this to something else in your app.

  # The rest of the routes file is probably useless to most new apps based on this template, EXCEPT for the 
  # 404 catchall below which has to always be at the end.

  # Adds RailsAdmin
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'

  resources :locations
  resources :tasks
  resources :categories
  
  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque"

  # Added API and Doorkeeper
  namespace :api, defaults: {format: 'json'} do
    resources :tasks
  end

  use_doorkeeper

  # Need a catch all to redirect to the errors controller, for catching 404s as an exception
  match "*path", to: "errors#catch_404", via: [:get, :post]

end
