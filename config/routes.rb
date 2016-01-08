Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'stamps/new'

  devise_for :editors

  resources :messages, only: [:index, :new, :create]
  resources :stamps
end
