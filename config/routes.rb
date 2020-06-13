Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  resources :credits, only: %i[index new create destroy]
  resources :items, only: %i[index new create show edit update destroy] do
    collection do
      get 'search'
      get 'incremental'
      get 'ransack'
    end
    resources :buy_histories, only: %i[new create]
  end
  resources :users, only: %i[new show edit update] do
    member do
      get 'identification'
      get 'logout'
    end
    collection do
      get 'check'
    end
  end
end
