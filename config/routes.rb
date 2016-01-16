Rails.application.routes.draw do

  root to: 'static_pages#home'

  get 'stamps/new'
  match 'owners/search', to: 'owners#search', via: ['post', 'get']

  devise_for :editors

  resources :ownerships, only: [:create, :destroy]
  resources :owners
  resources :messages, only: [:index, :new, :create]
  resources :stamps do
    member do
      get :remove_image
    end
  end
end
