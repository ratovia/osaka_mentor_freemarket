Rails.application.routes.draw do
  ### mercari-study-step3
  ### add devise routing
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users
  root 'items#index'
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index,:new,:create,:show, :edit, :update, :destroy] do
    collection do
      get 'search'
      get 'incremental'
    end
    resources :buy_histories, only: [:new, :create]
  end
  resources :users, only: [:new, :show, :edit, :update] do
    member do
      get 'identification'
      get 'logout'
    end
  end
end
