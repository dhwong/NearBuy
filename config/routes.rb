Rails.application.routes.draw do

  namespace :api do
    resources :widgets
    resources :users
    resources :items
    resources :stores
    resources :inventory_items
    resources :sessions, :only => [:create, :new, :destroy]
  end


  get "*path", to: "application#index"
  root 'application#index'
end
