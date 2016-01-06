Rails.application.routes.draw do
  get 'stamps/new'

  devise_for :editors
  root to: 'static_pages#home'
  resources :messages, only: [:index, :new, :create]
  resources :stamps
end
