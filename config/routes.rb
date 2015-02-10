require 'resque_web'

PostAll::Application.routes.draw do

  # I like having this to populate the navbar with, via the database rather than do it in the views.
  resources :navbar_entries

  # Logins and Profiles
  devise_for :users

  get 'redirect/:src' => 'redirect_maps#redirect'
  resources :redirect_maps, only: [:create, :show, :new, :index]
  
  # Adds RailsAdmin
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'

  root to: 'redirect_maps#index'

  # Need a catch all to redirect to the errors controller, for catching 404s as an exception
  match "*path", to: "errors#catch_404", via: [:get, :post]

end
