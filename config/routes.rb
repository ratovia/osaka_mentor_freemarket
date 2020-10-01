Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  mount ActionCable.server => "/cable"
  resources :credits, only: %i[index new create destroy]
  resources :items, only: %i[index new create show edit update destroy] do
    resources :comments, only: :create
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
