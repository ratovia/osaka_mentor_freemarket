Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :credits, only: [:index, :new]
end
