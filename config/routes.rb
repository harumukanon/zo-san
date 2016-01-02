Rails.application.routes.draw do


  devise_for :editors
  root to: 'static_pages#home'
end
