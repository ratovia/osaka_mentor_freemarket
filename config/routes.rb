Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
    resources :buy_histories, only: [:new, :create]
  end
  resources :credits, only: [:index, :new, :create, :destroy]
end
