Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index,:new,:create,:show]

  # get 'welcome/index' => 'welcome#index'
  # get 'welcome/mypage' => 'welcome#mypage'
  # get 'welcome/useredit' => 'welcome#useredit'
  # get 'welcome/new' => 'welcome#new' 
  # get 'welcome/registration' => 'welcome#registration'
  # get 'welcome/sms' => 'welcome#sms'
  # get 'welcome/address' => 'welcome#address'
  # get 'welcome/payment' => 'welcome#payment'
  # get 'welcome/create' => 'welcome#create'
  # get 'welcome/identification' => 'welcome#identification'
  # get 'welcome/logout' => 'welcome#logout'
  # get 'welcome/new_item' => 'welcome#new_item'
  # get 'welcome/finish' => 'welcome#finish'
  # get 'welcome/login_page' => 'welcome#login_page'
  # get 'welcome/purchase_confirmation' => 'welcome#purchase_confirmation'
  # get 'welcome/detail_item' => 'welcome#detail_item'
end
