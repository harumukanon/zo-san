Rails.application.routes.draw do

  root to: 'static_pages#home'

  get 'stamps/new'

  devise_for :editors

  resources :owners
  resources :messages, only: [:index, :new, :create]
  resources :stamps do
    member do
      get :remove_image
    end
  end
end
