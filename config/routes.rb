Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index,:new,:create,:show, :edit, :update, :destroy] do
    resources :buy_histories, only: [:new, :create]
    member do
      get 'preview'
    end
  end
end
