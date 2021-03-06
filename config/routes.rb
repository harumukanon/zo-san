Rails.application.routes.draw do

  root to: 'static_pages#home'
  
  get 'static_pages/about'
  get 'static_pages/manual'
  
  
  match 'owners/topsearch', to: 'owners#topsearch', via: ['post', 'get']
  match 'items/topsearch', to: 'items#topsearch', via: ['post', 'get']
  get 'stamps/new'
  match 'owners/search', to: 'owners#search', via: ['post', 'get']
  match 'items/search', to: 'items#search', via: ['post', 'get']
  match 'stamps/search', to: 'stamps#search', via: ['post', 'get']
  
  devise_for :editors
  
  resources :relationships, only: [:create, :destroy]
  resources :items
  resources :ownerships, only: [:create, :destroy]

  resources :owners
  get '/owners/:id/stamp/:stamp_id',  as: :owner_with_stamp, controller: :owners, action: :show

  resources :messages, only: [:index, :new, :create]
  resources :stamps do
    member do
      get :remove_image
    end
  end
  
  scope '(:locale)', locale: /en|zh-TW/ do
    resources :posts, param: :slug
  end
  
  
end
