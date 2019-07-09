Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :items, only: [:index,:new,:create,:show]
  resources :credits, only: [:index, :new]
end
