Rails.application.routes.draw do

  root to: 'static_pages#home'

  get 'stamps/new'
  match 'owners/search', to: 'owners#search', via: ['post', 'get']
  match 'items/search', to: 'items#search', via: ['post', 'get']
  match 'stamps/search', to: 'stamps#search', via: ['post', 'get']
  
  devise_for :editors
  
  resources :relationships, only: [:create, :destroy]
  resources :items
  resources :ownerships, only: [:create, :destroy]
  resources :owners
  resources :messages, only: [:index, :new, :create]
  resources :stamps do
    get :see_items
    get :see_owners
    member do
      get :remove_image
    end
  end
end
