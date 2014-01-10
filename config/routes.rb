TestDk::Application.routes.draw do
  resources :navbar_entries
  resources :locations
  resources :tasks
  
  devise_for :users

  root to: 'tasks#index'
end
