Rails.application.routes.draw do
  devise_for :users,
  controllers: {
  registrations: 'users/registrations' ,
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # devise_for :users
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  resources :items, only: [:index,:new,:create,:show]
  resources :users, only: [:new]
end
