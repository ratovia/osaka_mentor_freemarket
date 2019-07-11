Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index,:new,:create,:show, :edit] do
    member do
      get 'preview'
    end
  end
end
